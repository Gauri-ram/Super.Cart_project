import 'package:flutter/material.dart';
import 'package:supercart_new/core/app_export.dart';
import 'package:supercart_new/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:supercart_new/widgets/app_bar/appbar_title.dart';
import 'package:supercart_new/widgets/app_bar/custom_app_bar.dart';
import 'package:supercart_new/widgets/custom_elevated_button.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supercart_new/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class CheckoutPageoneScreen extends StatefulWidget {
  final List<double> checkoutDetails;

  const CheckoutPageoneScreen({Key? key, required this.checkoutDetails})
      : super(key: key);

  @override
  _CheckoutPageoneScreenState createState() => _CheckoutPageoneScreenState();
}

class _CheckoutPageoneScreenState extends State<CheckoutPageoneScreen> {
  Razorpay? _razorpay;
  late int itemCount;
  late double totalPrice;
  late double discount;
  late double finalAmount;

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS PAYMENT: ${response.paymentId}", timeInSecForIosWeb: 4);

    Navigator.pushNamed(context, AppRoutes.thankyouPageScreen);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR PAYMENT: ${response.code} - ${response.message}",
        timeInSecForIosWeb: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET IS: ${response.walletName}",
        timeInSecForIosWeb: 4);
  }

  @override
  void initState() {
    super.initState();
    itemCount = widget.checkoutDetails.isNotEmpty
        ? widget.checkoutDetails[0].truncate()
        : 0;
    totalPrice = widget.checkoutDetails[1];
    finalAmount = widget.checkoutDetails[2];
    discount = widget.checkoutDetails[3];
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void makePayment() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    var options = {
      'key': 'rzp_test_TdOGT5BsbxJDrE', //test mode
      // 'key': 'rzp_live_FLTPo2ImHpzU0H', //live mode
      'amount': finalAmount * 100, //paisa
      'name': "SuperCart",
      'description': 'item',
      'prefill': {
        'contact': ap.userModel.phoneNumber,
        'email': ap.userModel.email
      }
    };

    try {
      _razorpay?.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildNine(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: screenHeight * 0.1,
                      left: screenWidth * 0.1,
                      right: screenWidth * 0.1,
                      bottom: screenHeight * 0.1,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.01,
                      vertical: screenHeight * 0.01,
                    ),
                    decoration: AppDecoration.outlineBlack9002.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder25,
                      color: appTheme.lightGreen900,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.25,
                          child: Text(
                            "Subtotal \n\nDiscount\n\nTotal",
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleLarge!
                                .copyWith(fontSize: 15),
                          ),
                        ),
                        Container(
                          width: screenWidth * 0.25,
                          margin: EdgeInsets.only(
                              left: screenWidth * 0.1,
                              bottom: screenHeight * 0.1,
                              top: screenHeight * 0.1),
                          child: Text(
                            "₹$totalPrice \n\n₹$discount\n\n₹$finalAmount",
                            maxLines: 5,
                            // overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                            style: theme.textTheme.titleLarge!
                                .copyWith(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildPayment(context),
      ),
    );
  }

  Widget _buildNine(BuildContext context) {
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return Container(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.038),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
        ),
        color: appTheme.lightGreen900,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            height: screenHeight * 0.05,
            leadingWidth: screenWidth * 0.15,
            leading: AppbarLeadingIconbutton(
              margin: EdgeInsets.only(
                left: screenWidth * 0.01,
                top: screenHeight * 0.007,
                bottom: screenHeight * 0.012,
              ),
            ),
            title: AppbarTitle(
              text: "Check Out",
            ),
          ),
          SizedBox(height: screenHeight * 0.04),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.1),
            child: RichText(
              text: TextSpan(
                style: theme.textTheme.titleLarge!.copyWith(fontSize: 15),
                children: [
                  TextSpan(
                    text: "Number of items: ",
                  ),
                  TextSpan(
                    text: "$itemCount",
                  ),
                ],
              ),
              // textAlign: TextAlign.end,
            ),
          ),
          SizedBox(height: screenHeight * 0.04),
        ],
      ),
    );
  }

  Widget _buildPayment(BuildContext context) {
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return CustomElevatedButton(
      height: screenHeight * 0.075,
      text: "PAYMENT",
      margin: EdgeInsets.only(
        left: screenWidth * 0.1,
        right: screenWidth * 0.1,
        bottom: screenHeight * 0.05,
      ),
      buttonStyle: CustomButtonStyles.outlinePrimaryTL16,
      buttonTextStyle: theme.textTheme.titleLarge!,
      onPressed: () {
        makePayment();
      },
    );
  }
}
