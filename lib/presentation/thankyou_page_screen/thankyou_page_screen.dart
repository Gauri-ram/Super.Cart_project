import 'package:flutter/material.dart';
import 'package:supercart_new/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ThankyouPageonePage extends StatelessWidget {
  const ThankyouPageonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildThankYouMessage(context, screenWidth, screenHeight),
                SizedBox(height: 11 * screenHeight / 812), // Adjusted height
                SizedBox(
                  height: 485 * screenHeight / 812, // Adjusted height
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.img202311101009290000,
                        height: 485 * screenHeight / 812, // Adjusted height
                        width: screenWidth,
                        alignment: Alignment.center,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgShoppingCart,
                        height: 100 * screenHeight / 812, // Adjusted height
                        width: 100 * screenHeight / 812, // Adjusted width
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(
                            top: 24 * screenHeight / 812), // Adjusted margin
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  /// Section Widget
  Widget _buildThankYouMessage(
      BuildContext context, double screenWidth, double screenHeight) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 54 * screenWidth / 375, // Adjusted width
        vertical: 89 * screenHeight / 812, // Adjusted height
      ),
      decoration: AppDecoration.fillLightGreen.copyWith(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 20 * screenHeight / 812), // Adjusted height
          Container(
            width: 320 * screenWidth / 375, // Adjusted width
            margin: EdgeInsets.only(), // Adjusted margin
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "THANK YOU!\n",
                    style: CustomTextStyles.titleLargePrimary
                        .copyWith(color: Colors.white),
                  ),
                  TextSpan(
                    text: "YOUR PURCHASE WAS SUCCESSFUL",
                    style: theme.textTheme.displaySmall
                        ?.copyWith(color: Colors.white),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return Container(
      padding: EdgeInsets.all(5.0),
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
          // InkWell(
          //   onTap: () {
          //     Get.toNamed(AppRoutes.otpPageScreen);
          //   },
          //   child: Container(
          //     padding: EdgeInsets.all(screenHeight * 0.02),
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: Colors.white,
          //     ),
          //     child: CustomImageView(
          //       imagePath: ImageConstant.imgBarcode,
          //       width: screenWidth * 0.125,
          //     ),
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.mainPageonePage);
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgHome,
              height: screenHeight * 0.08,
            ),
          ),
        ],
      ),
    );
  }
}
