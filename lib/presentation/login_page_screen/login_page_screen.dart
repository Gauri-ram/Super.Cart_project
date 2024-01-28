import 'package:provider/provider.dart';
import 'package:supercart_new/provider/auth_provider.dart';

import 'controller/login_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supercart_new/core/app_export.dart';
import 'package:supercart_new/widgets/custom_elevated_button.dart';

class LoginPageScreen extends GetWidget<LoginPageController> {
  const LoginPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void sendPhoneNumber() {
      final ap = Provider.of<AuthProvider>(context, listen: false);
      String phoneNumber =
          controller.enterMobileNumbervalueController.text.trim();
      ap.signInWithPhone(context, "+91$phoneNumber");
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: screenWidth,
          child: Container(
            child: Column(
              children: [
                _buildLoginSection(screenWidth, screenHeight),
                SizedBox(height: screenHeight * 0.1),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.15, right: screenWidth * 0.15),
                  child: Row(
                    children: [
                      Text(
                        "+91 ",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller:
                              controller.enterMobileNumbervalueController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(
                                10), // Limit to 10 digits
                          ],
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.1),
                CustomElevatedButton(
                  text: "lbl_login".tr,
                  margin: EdgeInsets.only(
                      left: screenWidth * 0.11, right: screenWidth * 0.11),
                  buttonStyle: CustomButtonStyles.outlinePrimaryTL16,
                  buttonTextStyle: theme.textTheme.titleLarge!,
                  onPressed: () => sendPhoneNumber(),
                  height: screenHeight * 0.075,
                ),
                SizedBox(height: screenHeight * 0.09),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginSection(double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth,
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04, vertical: screenHeight * 0.04),
      decoration: AppDecoration.fillLightGreen.copyWith(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: screenHeight * 0.015),
          CustomImageView(
            imagePath: ImageConstant.imgLogin,
            height: screenHeight * 0.15,
            alignment: Alignment.centerRight,
          ),
          SizedBox(height: screenHeight * 0.07),
          Container(
            decoration: AppDecoration.outlineOnPrimaryContainer,
            child: Text(
              "msg_enter_mobile_number".tr,
              style: CustomTextStyles.titleLargeWhiteA700,
            ),
          ),
        ],
      ),
    );
  }

  onTapLOGIN() {
    Get.toNamed(AppRoutes.otpPageScreen);
  }
}
