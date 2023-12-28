import '../controller/otp_page_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OtpPageScreen.
///
/// This class ensures that the OtpPageController is created when the
/// OtpPageScreen is first loaded.
class OtpPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpPageController());
  }
}
