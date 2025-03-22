import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_project/controllers/theme_controller.dart';
import 'package:test_project/utils/app_pages.dart';
import 'package:test_project/utils/constants/app_page_names.dart';
import 'package:test_project/utils/theme/theme.dart';

Future<void> main() async {
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          title: 'Test Project',
          getPages: AppPages.pages,
          unknownRoute: AppPages.unknownScreenPageRoute,
          initialRoute: AppPageNames.rootScreen,
          debugShowCheckedModeBanner: false,
          theme: AppThemeData.lightTheme,
          darkTheme: AppThemeData.darkTheme,
          themeMode: themeController.isDarkMode.value
              ? ThemeMode.dark
              : ThemeMode.light, // Dynamically update theme
        ));
  }
}
