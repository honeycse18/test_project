import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/controllers/verification_controller.dart';
import 'package:test_project/utils/constants/app_gaps.dart';
import 'package:test_project/utils/constants/constant.dart';
import 'package:test_project/utils/constants/images.dart';
import 'package:test_project/widgets/core_widget.dart';

import '../../widgets/number_pad.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    return GetBuilder<VerificationController>(
      global: false,
      init: VerificationController(),
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: screenHeight - MediaQuery.of(context).padding.top,
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        AppAssetImages.pinbackImage,
                        height: 600,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: screenHeight * 0.05),
                      Center(
                        child: Image.asset(
                          AppAssetImages.logoImage,
                          height: screenHeight * 0.12,
                          width: screenWidth * 0.25,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.025),
                      Text(
                        AppConstants.enterPinText,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      SizedBox(height: screenHeight * 0.15),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                        child: Obx(() => PinInputField(
                              pin: controller.pinText.value,
                              onTap: controller.deleteNumber,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                        child: Container(
                          width: screenWidth * 0.8,
                          child: NumberPad(
                            onNumberPressed: controller.addNumber,
                            onDeletePressed: controller.deleteNumber,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                        child: SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            btntext: AppConstants.confirmText,
                            ontap: controller.confirmPin,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.006),
                        child: TextButton(
                          onPressed: controller.resendPin,
                          child: Text(
                            AppConstants.resendPinText,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
