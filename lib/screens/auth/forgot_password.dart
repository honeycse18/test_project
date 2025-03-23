import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/controllers/forgot_password_controller.dart';
import 'package:test_project/controllers/theme_controller.dart';
import 'package:test_project/screens/auth/verification.dart';
import 'package:test_project/utils/constants/app_gaps.dart';
import 'package:test_project/utils/constants/constant.dart';
import 'package:test_project/utils/constants/images.dart';
import 'package:test_project/widgets/core_widget.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    return GetBuilder<ForgotPasswordController>(
        global: false,
        init: ForgotPasswordController(),
        builder: (controller) => CustomScaffold(
              resizeToAvoidBottomInset: false, // Add this line
              body: SafeArea(
                child: Column(
                  children: [
                    AppGaps.hGap45,
                    Center(
                      child: Image.asset(
                        AppAssetImages.logoImage,
                        height: 104.99,
                        width: 105.08,
                      ),
                    ),
                    AppGaps.hGap21,
                    Text(
                      AppConstants.forgotText,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    AppGaps.hGap5,
                    Text("Please enter you email",
                        style: Theme.of(context).textTheme.labelSmall),
                    AppGaps.hGap90,

                    // Email Input
                    Padding(
                      padding: const EdgeInsets.only(left: 26.0, right: 26),
                      child: CustomGradientBorderTextField(
                        controller: controller.emailController,
                        labelText: ' Email ',
                      ),
                    ),
                    AppGaps.hGap36,
                    CustomGradientButton(
                      btntext: AppConstants.submitText,
                      ontap: () {
                        Get.to(() => VerificationScreen());
                      },
                    ),
                  ],
                ),
              ),
            ));
  }
}
