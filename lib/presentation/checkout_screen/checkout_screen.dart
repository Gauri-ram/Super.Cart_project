import 'package:flutter/material.dart';
import 'package:supercart_new/core/app_export.dart';
import 'package:supercart_new/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:supercart_new/widgets/app_bar/appbar_title.dart';
import 'package:supercart_new/widgets/app_bar/custom_app_bar.dart';
import 'package:supercart_new/widgets/custom_elevated_button.dart';

class CheckoutPageoneScreen extends StatelessWidget {
  const CheckoutPageoneScreen({Key? key}) : super(key: key);

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
                            "₹73\n\n-₹5\n\n₹68",
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
                    text: "4",
                  ),
                  TextSpan(
                    text: " items",
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
        Get.toNamed(AppRoutes.mainPageonePage);
      },
    );
  }
}
