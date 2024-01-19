import 'package:supercart_new/presentation/otp_page_screen/controller/otp_page_controller.dart';
import 'package:supercart_new/presentation/info_contact_us_screen/info_contact_us_screen.dart';
import 'package:supercart_new/presentation/previous_order_screen/previous_order_screen.dart';
import 'package:supercart_new/presentation/welcome_page_screen/welcome_page_screen.dart';
import 'package:supercart_new/presentation/welcome_page_screen/binding/welcome_page_binding.dart';
import 'package:supercart_new/presentation/otp_page_screen/otp_page_screen.dart';
import 'package:supercart_new/presentation/otp_page_screen/binding/otp_page_binding.dart';
import 'package:supercart_new/presentation/login_page_screen/login_page_screen.dart';
import 'package:supercart_new/presentation/login_page_screen/binding/login_page_binding.dart';
import 'package:supercart_new/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:supercart_new/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:supercart_new/presentation/main_pageone_page/main_pageone_page.dart';
import 'package:supercart_new/presentation/checkout_screen/checkout_screen.dart';
import 'package:supercart_new/presentation/profile_page_screen/profile_page_screen.dart';
import 'package:supercart_new/presentation/info_contact_us_screen/info_contact_us_screen.dart';
import 'package:supercart_new/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:supercart_new/presentation/previous_order_screen/previous_order_screen.dart';
import 'package:supercart_new/presentation/thankyou_page_screen/thankyou_page_screen.dart';
import 'package:get/get.dart';

// class OtpPageBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<OtpPageController>(() => OtpPageController());
//   }
// }

class AppRoutes {
  static const String welcomePageScreen = '/welcome_page_screen';

  static const String otpPageScreen = '/otp_page_screen';

  static const String loginPageScreen = '/login_page_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String mainPageonePage = '/main_pageone_page';

  static const String initialRoute = '/initialRoute';

  static const String checkoutRoute = '/checkout_screen';

  static const String profilePageScreen = '/profile_page_screen';

  static const String infoContactUsPageScreen = '/info_contact_us_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String previousOrderScreen = '/previous_order_screen';

  static const String thankyouPageScreen = '/thankyou_page_screen';

  static List<GetPage> pages = [
    GetPage(
      name: welcomePageScreen,
      page: () => WelcomePageScreen(),
      bindings: [
        WelcomePageBinding(),
      ],
    ),
    GetPage(
      name: otpPageScreen,
      page: () => OtpPageScreen(
        verificationId: otpPageScreen,
        controller: OtpPageController(),
      ),
      bindings: [
        OtpPageBinding(),
      ],
    ),
    GetPage(
      name: loginPageScreen,
      page: () => LoginPageScreen(),
      bindings: [
        LoginPageBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: mainPageonePage,
      page: () => MainPageonePage(),
    ),
    GetPage(
      name: thankyouPageScreen,
      page: () => ThankyouPageonePage(),
    ),
    GetPage(
      name: checkoutRoute,
      page: () => CheckoutPageoneScreen(),
    ),
    GetPage(
      name: previousOrderScreen,
      page: () => PreviousOrderScreen(),
    ),
    GetPage(
      name: profilePageScreen,
      page: () => ProfilePageScreen(),
    ),
    GetPage(
      name: infoContactUsPageScreen,
      page: () => InfoContactUsScreen(),
    ),
    GetPage(
      name: editProfileScreen,
      page: () => EditProfileScreen(),
    ),
    GetPage(
      name: initialRoute,
      page: () => WelcomePageScreen(),
      bindings: [
        WelcomePageBinding(),
      ],
    )
  ];

  // static Map<String, WidgetBuilder> routes = {
  //   mainPageonePage: (context) => MainPageonePage(),
  //   // profilePageScreen: (context) => ProfilePageScreen(),
  //   // previousOrdersScreen: (context) => PreviousOrdersScreen(),
  //   // infoContactUsScreen: (context) => InfoContactUsScreen(),
  //   // checkoutPageoneScreen: (context) => CheckoutPageoneScreen(),
  //   // thankyouPageoneContainerScreen: (context) => ThankyouPageoneContainerScreen(),
  //   appNavigationScreen: (context) => AppNavigationScreen()
  // };
}
