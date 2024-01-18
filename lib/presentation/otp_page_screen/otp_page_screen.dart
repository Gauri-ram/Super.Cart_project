import 'controller/otp_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:supercart_new/core/app_export.dart';
import 'package:supercart_new/widgets/custom_elevated_button.dart';
import 'package:supercart_new/widgets/custom_icon_button.dart';
// import 'package:supercart_new/widgets/custom_pin_code_text_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPageScreen extends GetWidget<OtpPageController> {
  const OtpPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildSection(screenWidth, screenHeight),
              CustomIconButton(
                height: screenHeight * 0.03,
                width: screenWidth * 0.08,
                alignment: Alignment.centerRight,
                onTap: onTapBtnClose,
                child: CustomImageView(),
              ),
              Container(
                width: screenWidth * 0.8,
                margin: EdgeInsets.only(
                    left: screenWidth * 0.04, right: screenWidth * 0.04),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.12),
                child: Obx(() => PinCodeTextField(
                      appContext: Get.context!,
                      length: 4,
                      controller: controller.otpController.value,
                      onChanged: (value) {},
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10.0),
                        fieldHeight: screenHeight * 0.075,
                        fieldWidth: screenWidth * 0.09,
                        activeFillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                    )),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: _buildConfirmButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConfirmButton() {
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return CustomElevatedButton(
      height: screenHeight * 0.1,
      width: screenWidth * 0.8,
      text: "lbl_confirm".tr,
      margin: EdgeInsets.only(
          left: screenWidth * 0.1,
          right: screenWidth * 0.1,
          bottom: screenHeight * 0.02),
      buttonStyle: CustomButtonStyles.outlinePrimaryTL11,
      buttonTextStyle: CustomTextStyles.labelLargeGray200,
      onPressed: onTapBtnConfirm,
    );
  }

  Widget _buildSection(double screenWidth, double screenHeight) {
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
              "msg_enter_otp_received".tr,
              style: CustomTextStyles.titleLargeWhiteA700,
            ),
          ),
        ],
      ),
    );
  }

  onTapBtnClose() {
    Get.toNamed(AppRoutes.loginPageScreen);
  }

  onTapBtnConfirm() {
    Get.toNamed(AppRoutes.mainPageonePage);
  }
}
