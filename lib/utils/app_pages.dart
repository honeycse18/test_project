import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test_project/screens/intro.dart';
import 'package:test_project/screens/auth/login.dart';
import 'package:test_project/screens/unknown_screen.dart';
import 'package:test_project/utils/constants/app_page_names.dart';

class AppPages {
  static final List<GetPage<dynamic>> pages = [
    GetPage(name: AppPageNames.rootScreen, page: () => const IntroScreen()),
    GetPage(name: AppPageNames.logInScreen, page: () => Login()),

    // GetPage(
    //     name: AppPageNames.verificationScreen,
    //     page: () => const VerificationScreen()),
    // GetPage(name: AppPageNames.offerScreen, page: () => const OfferScreen()),
  ];

  static final GetPage<dynamic> unknownScreenPageRoute = GetPage(
      name: AppPageNames.unknownScreen, page: () => const UnknownScreen());
}
