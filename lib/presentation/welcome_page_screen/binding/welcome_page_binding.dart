import '../controller/welcome_page_controller.dart';
import 'package:get/get.dart';

/// A binding class for the WelcomePageScreen.
///
/// This class ensures that the WelcomePageController is created when the
/// WelcomePageScreen is first loaded.
class WelcomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomePageController());
  }
}
