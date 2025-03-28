import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:test_project/controllers/intro_controller.dart';
import 'package:test_project/controllers/theme_controller.dart';
import 'package:test_project/screens/auth/login.dart';
import 'package:test_project/utils/constants/app_gaps.dart';
import 'package:test_project/utils/constants/colors.dart';
import 'package:test_project/utils/constants/constant.dart';
import 'package:test_project/utils/constants/images.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return GetBuilder<IntroController>(
      global: false,
      init: IntroController(),
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Obx(() => Icon(
                    themeController.isDarkMode.value
                        ? Icons.light_mode
                        : Icons.dark_mode,
                    color: themeController.isDarkMode.value
                        ? Colors.white
                        : AppColors.darkprimaryTextColor,
                  )),
              onPressed: themeController.toggleTheme,
            ),
          ],
        ),
        body: GestureDetector(
          onVerticalDragEnd: (details) {
            if (details.velocity.pixelsPerSecond.dy < -300) {
              Get.to(() => Login());
            }
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    AppAssetImages.introImage,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              AppGaps.hGap45,
              Column(
                children: [
                  Center(
                    child: Image.asset(
                      AppAssetImages.logoImage,
                      height: 104.99,
                      width: 105.08,
                    ),
                  ),
                  AppGaps.hGap24,
                  Text(
                    AppConstants.effectivoText,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppConstants.welcomeText,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    AppGaps.hGap26,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('— ',
                            style: Theme.of(context).textTheme.headlineMedium),
                        Text(AppConstants.instruction,
                            style: Theme.of(context).textTheme.headlineLarge),
                        Text(' —',
                            style: Theme.of(context).textTheme.headlineMedium),
                      ],
                    ),
                    AppGaps.hGap8,
                    Padding(
                      padding: const EdgeInsets.only(left: 55.0, right: 55.0),
                      child: Text(
                        AppConstants.instruction2,
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    AppGaps.hGap45,
                    InkWell(
                      onTap: controller.authenticate,
                      child: Container(
                        height: 71,
                        width: 71,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.all(
                              color: themeController.isDarkMode.value
                                  ? AppColors.darkprimaryTextColor
                                  : Colors.white,
                              width: 1),
                        ),
                        child: Center(
                            child: SvgPicture.asset(
                          AppAssetImages.fingerPrintLogoLine,
                          color: themeController.isDarkMode.value
                              ? AppColors.darkprimaryTextColor
                              : Colors.white,
                        )),
                      ),
                    ),
                    AppGaps.hGap30,
                    Text(
                      AppConstants.swipeButtonText,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    AppGaps.hGap30,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
