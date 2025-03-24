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

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    return GetBuilder<RegisterController>(
        global: false,
        init: RegisterController(),
        builder: (controller) => CustomScaffold(
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight:
                          screenHeight - MediaQuery.of(context).padding.top,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: screenHeight * 0.02),
                          Center(
                            child: Image.asset(
                              AppAssetImages.logoImage,
                              height: screenHeight * 0.12,
                              width: screenWidth * 0.25,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            AppConstants.registerText,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          SizedBox(height: screenHeight * 0.04),
                          CustomGradientBorderTextField(
                            controller: controller.emailController,
                            labelText: ' Email ',
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          CustomGradientBorderTextField(
                            controller: controller.passwordController,
                            labelText: ' Password ',
                            obscureText: true,
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          CustomGradientBorderTextField(
                            controller: controller.confirmPasswordController,
                            labelText: ' Confirm Password ',
                            obscureText: true,
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          CustomGradientButton(
                            btntext: AppConstants.registerText,
                            ontap: () {},
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppConstants.alreadyHaveAccountText,
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppPageNames.logInScreen);
                                },
                                child: Text(AppConstants.login,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                            color: AppColors.signUpColor)),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.16),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('— ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge),
                                  Text(AppConstants.signUpWith,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge),
                                  Text(' —',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.03),
                              FittedBox(
                                  child: Row(
                                children: [
                                  LogoCircleBackground(
                                    img: SvgPicture.asset(
                                      AppAssetImages.googleSVGLogoSolid,
                                      color: themeController.isDarkMode.value
                                          ? Colors.white
                                          : Colors.red,
                                    ),
                                  ),
                                  AppGaps.wGap25,
                                  LogoCircleBackground(
                                    img: SvgPicture.asset(
                                      AppAssetImages.fbSVGLogoSolid,
                                      color: themeController.isDarkMode.value
                                          ? Colors.white
                                          : AppColors.logoColor1,
                                    ),
                                  ),
                                  AppGaps.wGap25,
                                  LogoCircleBackground(
                                    img: SvgPicture.asset(
                                      AppAssetImages.twSVGLogoSolid,
                                      color: themeController.isDarkMode.value
                                          ? Colors.white
                                          : AppColors.logoColor2,
                                    ),
                                  ),
                                  AppGaps.wGap25,
                                  LogoCircleBackground(
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
                              )),
                              SizedBox(height: screenHeight * 0.02),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
