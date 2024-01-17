import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supercart_new/core/app_export.dart';
import 'package:supercart_new/presentation/otp_page_screen/controller/otp_page_controller.dart';
import 'package:supercart_new/provider/auth_provider.dart';
import 'package:supercart_new/widgets/custom_elevated_button.dart';
import 'package:supercart_new/widgets/custom_icon_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPageScreen extends StatefulWidget {
  final String verificationId;
  final OtpPageController controller;

  const OtpPageScreen(
      {Key? key, required this.verificationId, required this.controller})
      : super(key: key);

  @override
  _OtpPageScreenState createState() => _OtpPageScreenState();
}

class _OtpPageScreenState extends State<OtpPageScreen> {
  late double screenWidth;
  late double screenHeight;
  late MediaQueryData mediaQueryData;
  String? otpcode;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return SafeArea(
      child: isLoading == true
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.greenAccent,
              ),
            )
          : Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                width: screenWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context),
                          child: const Icon(Icons.arrow_back),
                        )),
                    _buildSection(screenWidth, screenHeight),
                    CustomIconButton(
                      height: screenHeight * 0.03,
                      width: screenWidth * 0.08,
                      alignment: Alignment.centerRight,
                      onTap: onTapBtnClose,
                      child: CustomImageView(),
                    ),
                    Container(
                      width: screenWidth * 1,
                      margin: EdgeInsets.only(
                        left: screenWidth * 0.01,
                        right: screenWidth * 0.01,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.10),
                      child: Obx(() => PinCodeTextField(
                            appContext: Get.context!,
                            length: 4,
                            controller: widget.controller.otpController.value,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(10.0),
                              fieldHeight: screenHeight * 0.075,
                              fieldWidth: screenWidth * 0.12,
                              activeFillColor: Colors.lightGreen[200],
                            ),
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                otpcode = value;
                              });
                            },
                            keyboardType: TextInputType.number,
                          )),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: _buildConfirmButton(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Did'nt receive any code?",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38)),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text("Resend Code",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)),
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
      text: "Verify".tr,
      margin: EdgeInsets.only(
          left: screenWidth * 0.1,
          right: screenWidth * 0.1,
          bottom: screenHeight * 0.02),
      buttonStyle: CustomButtonStyles.outlinePrimaryTL11,
      buttonTextStyle: CustomTextStyles.labelLargeGray200,
      onPressed: () {
        if (otpcode != null) {
          verifyOtp(context, otpcode!);
        } else {
          print("Enter 4 digit code");
        }
      },
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

  // verify otp
  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
        context: context,
        verificationId: widget.verificationId,
        userOtp: userOtp,
        onSuccess: () {
          ap.checkExistingUser().then((value) async {
            if (value == true) {
            } else {}
          });
        });
  }
}
