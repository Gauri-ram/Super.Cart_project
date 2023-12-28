import 'package:supercart_new/core/app_export.dart';
import 'package:supercart_new/presentation/login_page_screen/models/login_page_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the LoginPageScreen.
///
/// This class manages the state of the LoginPageScreen, including the
/// current loginPageModelObj
class LoginPageController extends GetxController {
  TextEditingController enterMobileNumbervalueController =
      TextEditingController();

  Rx<LoginPageModel> loginPageModelObj = LoginPageModel().obs;

  @override
  void onClose() {
    super.onClose();
    enterMobileNumbervalueController.dispose();
  }
}
