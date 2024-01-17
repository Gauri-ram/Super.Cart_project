import 'package:supercart_new/core/app_export.dart';
import 'package:supercart_new/presentation/otp_page_screen/models/otp_page_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';

/// A controller class for the OtpPageScreen.
///
/// This class manages the state of the OtpPageScreen, including the
/// current otpPageModelObj
class OtpPageController extends GetxController with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;

  Rx<OtpPageModel> otpPageModelObj = OtpPageModel().obs;

  @override
  void codeUpdated() {
    otpController.value.text = code ?? '';
  }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }

  @override
  void dispose() {
    // Dispose of the TextEditingController when the controller is disposed
    otpController.value.dispose();
    super.dispose();
  }
}
