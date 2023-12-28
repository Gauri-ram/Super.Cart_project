import 'package:supercart_new/core/app_export.dart';
import 'package:supercart_new/presentation/welcome_page_screen/models/welcome_page_model.dart';

/// A controller class for the WelcomePageScreen.
///
/// This class manages the state of the WelcomePageScreen, including the
/// current welcomePageModelObj
class WelcomePageController extends GetxController {
  Rx<WelcomePageModel> welcomePageModelObj = WelcomePageModel().obs;
}
