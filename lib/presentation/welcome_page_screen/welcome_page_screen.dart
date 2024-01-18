import 'controller/welcome_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:supercart_new/core/app_export.dart';
import 'package:supercart_new/widgets/custom_elevated_button.dart';

class WelcomePageScreen extends GetWidget<WelcomePageController> {
  const WelcomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: screenWidth,
          child: Column(
            children: [
              // Use screenWidth and screenHeight where needed
              SizedBox(height: screenHeight * 0.1),

              Expanded(
                child: Container(
                  child: SizedBox(
                    // Use screenWidth and screenHeight for container size
                    height: screenHeight * 0.8,
                    width: screenWidth,

                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        // Image of supercart
                        CustomImageView(
                          imagePath: ImageConstant.img202311101009290000,
                          height: screenHeight * 0.65,
                          width: screenWidth,
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: screenHeight * 0.001),
                        ),

                        // Welcome text
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            // Use screenWidth for width
                            width: screenWidth,
                            margin: EdgeInsets.only(top: screenHeight * 0.01),
                            decoration: AppDecoration.outlinePrimary,
                            child: Text(
                              "lbl_welcome".tr,
                              textAlign: TextAlign.center,
                              maxLines: null,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.displayMedium,
                            ),
                          ),
                        ),

                        // Container containing button and text
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.1,
                              vertical: screenHeight * 0.01,
                            ),
                            decoration: AppDecoration.fillLightGreen.copyWith(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      // Use screenWidth and screenHeight for size and margin
                                      width: screenWidth,
                                      height: screenHeight * 0.15,
                                      margin: EdgeInsets.only(
                                        left: screenWidth * 0.005,
                                        right: screenWidth * 0.005,
                                        top: screenHeight * 0.01,
                                        bottom: screenHeight * 0.01,
                                      ),
                                      child: Expanded(
                                        child: Text(
                                          "msg_revolutionising".tr,
                                          maxLines: 8,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: CustomTextStyles
                                              .labelMediumGray200,
                                        ),
                                      )),
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                CustomElevatedButton(
                                    text: "lbl_get_started".tr,
                                    margin: EdgeInsets.only(),
                                    onPressed: () {
                                      navigateToLogin();
                                    },
                                    height: screenHeight * 0.12),
                                SizedBox(height: screenHeight * 0.025),
                              ],
                            ),
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
      ),
    );
  }

  /// Navigates to the loginPageScreen when the action is triggered.
  navigateToLogin() {
    Get.toNamed(
      AppRoutes.loginPageScreen,
    );
  }
}
