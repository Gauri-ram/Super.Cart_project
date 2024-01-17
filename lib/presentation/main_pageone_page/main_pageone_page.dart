import '../main_pageone_page/widgets/productlist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:supercart_new/core/app_export.dart';

class MainPageonePage extends StatefulWidget {
  const MainPageonePage({Key? key}) : super(key: key);

  @override
  _MainPageonePageState createState() => _MainPageonePageState();
}

class _MainPageonePageState extends State<MainPageonePage> {
  late double screenWidth;
  late double screenHeight;

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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.013),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(),
            child: Text(
              "Item Name",
              style: theme.textTheme.titleMedium,
            ),
          ),
          Spacer(
            flex: 71,
          ),
          Padding(
            padding: EdgeInsets.only(),
            child: Text(
              "Quantity",
              style: theme.textTheme.titleMedium,
            ),
          ),
          Spacer(
            flex: 28,
          ),
          Text(
            "Price",
            style: theme.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildProductList(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return SizedBox(
          height: screenHeight * 0.025,
        );
      },
      itemCount: 6,
      itemBuilder: (context, index) {
        return ProductlistItemWidget();
      },
    );
  }

  Widget _buildBottomNavigationBar() {
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
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.checkoutRoute);
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgCart,
              height: screenHeight * 0.08,
            ),
          ),
        ],
      ),
    );
  }
}
