import 'package:flutter/services.dart';
import 'package:supercart_new/utils/utils.dart';
import 'package:supercart_new/model/mongodb.dart';
import '../main_pageone_page/widgets/productlist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:supercart_new/core/app_export.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:supercart_new/presentation/checkout_screen/checkout_screen.dart';
import 'package:provider/provider.dart';
import 'package:supercart_new/provider/auth_provider.dart';

class MainPageonePage extends StatefulWidget {
  const MainPageonePage({Key? key}) : super(key: key);

  @override
  _MainPageonePageState createState() => _MainPageonePageState();
}

class _MainPageonePageState extends State<MainPageonePage> {
  late double screenWidth;
  late double screenHeight;
  List<String> scannedBarcodeIDs = [];

  // List<String> scannedBarcodeIDs = ["10000001", "10000002", "10000004"];
  List<Map<String, dynamic>> inventoryItems = [];

  Future<void> scanBarcode() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    try {
      String result = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      debugPrint(result);
      var mongoDatabase = await MongoDatabase.connect();
      bool exists = await mongoDatabase.checkBarcodeExists(result);
      if (exists) {
        showSnackBar(context, result);
        await mongoDatabase.addToCart(ap.userModel.email, result);
        // setState(() {
        //   scannedBarcodeIDs.add(result);
        // });
        await _fetchInventoryItems(); // Add scanned barcode ID to the list
      } else {
        // Show a message indicating that the scanned barcode ID does not exist
        showSnackBar(context, 'Barcode ID does not exist');
      }
    } on PlatformException {
      String errorMessage = 'Failed to get platform version. ';
      debugPrint(errorMessage);
      // setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchInventoryItems();
  }

  Future<void> _fetchInventoryItems() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    try {
      var mongoDatabase = await MongoDatabase.connect();
      var items = await mongoDatabase.getCartItems(ap.userModel.email);
      setState(() {
        inventoryItems = items;
      });
    } catch (e) {
      print("Error fetching inventory items: $e");
    }
  }

  Future<void> _deleteCartItem(String userEmail, String barcodeID) async {
    try {
      var mongoDatabase = await MongoDatabase.connect();
      await mongoDatabase.deleteCartItem(userEmail, barcodeID);
    } catch (e) {
      print("Error deleting cart item: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.035),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.013),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.05),
                            child: Text(
                              "Cart",
                              style: TextStyle(
                                  fontSize: 35.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.035),
                        _buildCartRow(context),
                        SizedBox(height: screenHeight * 0.035),
                        _buildProductList(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  /// Section Widget
  Widget _buildCartRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.013),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 30,
          ),
          Padding(
            padding: EdgeInsets.only(),
            child: Text(
              "Item",
              style: theme.textTheme.titleMedium,
            ),
          ),
          Spacer(
            flex: 35,
          ),
          Padding(
            padding: EdgeInsets.only(),
            child: Text(
              "Qty",
              style: theme.textTheme.titleMedium,
            ),
          ),
          Spacer(
            flex: 7,
          ),
          Text(
            "Price",
            style: theme.textTheme.titleMedium,
          ),
          Spacer(
            flex: 25,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildProductList(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: ListView.separated(
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: screenHeight * 0.025,
            );
          },
          itemCount: inventoryItems.length + 1,
          itemBuilder: (context, index) {
            if (index == inventoryItems.length) {
              return SizedBox(height: screenHeight * 0.025);
            }
            String itemName = inventoryItems[index]['itemName'];
            int itemPrice = inventoryItems[index]['itemPrice'];
            String img = inventoryItems[index]['img'];
            return ProductlistItemWidget(
              itemName: itemName,
              itemPrice: itemPrice,
              img: img,
              onDelete: () async {
                String barcode = inventoryItems[index]['barcodeID'];
                setState(() {
                  inventoryItems.removeAt(index);
                });
                await _deleteCartItem(ap.userModel.email, barcode);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    // Calculate the total price
    double totalPrice = 0;
    for (var item in inventoryItems) {
      totalPrice += item['itemPrice'] as int;
    }
    double discount = totalPrice * 5 / 100;
    double finalAmount = totalPrice - discount;

    // Get the number of items in inventoryItems
    double itemCount = inventoryItems.length.toDouble();
    return Container(
      padding: EdgeInsets.all(10.0),
      color: appTheme.lightGreen900,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.profilePageScreen);
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgProfile,
              height: screenHeight * 0.06,
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.otpPageScreen);
            },
            child: Container(
              padding: EdgeInsets.all(screenHeight * 0.02),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgBarcode,
                width: screenWidth * 0.125,
                onTap: scanBarcode,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              List<double> checkoutDetails = [
                itemCount,
                totalPrice,
                finalAmount,
                discount
              ];
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CheckoutPageoneScreen(checkoutDetails: checkoutDetails),
                ),
              );
              // Get.toNamed(AppRoutes.checkoutRoute, arguments: checkoutDetails);
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgCart,
              height: screenHeight * 0.06,
            ),
          ),
        ],
      ),
    );
  }
}
