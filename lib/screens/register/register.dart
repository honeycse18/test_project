import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_project/controllers/register_controller.dart';
import 'package:test_project/controllers/theme_controller.dart';
import 'package:test_project/utils/constants/app_gaps.dart';
import 'package:test_project/utils/constants/app_page_names.dart';
import 'package:test_project/utils/constants/colors.dart';
import 'package:test_project/utils/constants/constant.dart';
import 'package:test_project/utils/constants/images.dart';
import 'package:test_project/widgets/core_widget.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        global: false,
        init: RegisterController(),
        builder: (controller) => CustomScaffold(
              resizeToAvoidBottomInset: false, // Add this line
              body: SafeArea(
                child: Column(
                  children: [
                    AppGaps.hGap5,
                    Center(
                      child: Image.asset(
                        AppAssetImages.logoImage,
                        height: 104.99,
                        width: 105.08,
                      ),
                    ),
                    AppGaps.hGap24,
                    Text(
                      AppConstants.registerText,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    AppGaps.hGap35,

                    // Email Input
                    Padding(
                      padding: const EdgeInsets.only(left: 26.0, right: 26),
                      child: CustomGradientBorderTextField(
                        controller: controller.emailController,
                        labelText: ' Email ',
                      ),
                    ),
                    AppGaps.hGap15,
                    Padding(
                      padding: const EdgeInsets.only(left: 26.0, right: 26),
                      child: CustomGradientBorderTextField(
                        controller: controller.passwordController,
                        labelText: ' Password ',
                        obscureText: true,
                      ),
                    ),
                    AppGaps.hGap15,
                    Padding(
                      padding: const EdgeInsets.only(left: 26.0, right: 26),
                      child: CustomGradientBorderTextField(
                        controller: controller.passwordController,
                        labelText: ' Confirm Password ',
                        obscureText: true,
                      ),
                    ),

                    AppGaps.hGap20,
                    CustomGradientButton(
                      btntext: AppConstants.registerText,
                      ontap: () {},
                    ),
                    AppGaps.hGap20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppConstants.alreadyHaveAccountText,
                            style: Theme.of(context).textTheme.labelMedium),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppPageNames.logInScreen);
                          },
                          child: Text(AppConstants.login,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: AppColors.signUpColor)),
                        ),
                      ],
                    ),
                    AppGaps.hGap100,
                    AppGaps.hGap40,
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('— ',
                                    style:
                                        Theme.of(context).textTheme.labelLarge),
                                Text(AppConstants.signUpWith,
                                    style:
                                        Theme.of(context).textTheme.labelLarge),
                                Text(' —',
                                    style:
                                        Theme.of(context).textTheme.labelLarge),
                              ],
                            ),
                            AppGaps.hGap34,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                LogoBackground(
                                  img: SvgPicture.asset(
                                    AppAssetImages.googleSVGLogoSolid,
                                    color: themeController.isDarkMode.value
                                        ? Colors.white
                                        : Colors.red,
                                  ),
                                ),
                                LogoBackground(
                                  img: SvgPicture.asset(
                                    AppAssetImages.fbSVGLogoSolid,
                                    color: themeController.isDarkMode.value
                                        ? Colors.white
                                        : AppColors.logoColor1,
                                  ),
                                ),
                                LogoBackground(
                                  img: SvgPicture.asset(
                                    AppAssetImages.twSVGLogoSolid,
                                    color: themeController.isDarkMode.value
                                        ? Colors.white
                                        : AppColors.logoColor2,
                                  ),
                                ),
                                LogoBackground(
                                  img: themeController.isDarkMode.value
                                      ? SvgPicture.asset(
                                          AppAssetImages.instaSVGLogoSolid,
                                          color: Colors.white,
                                        )
                                      : SvgPicture.asset(
                                          AppAssetImages.instaSVGLogoSolid,
                                        ),
                                ),
                              ],
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ));
  }
}
