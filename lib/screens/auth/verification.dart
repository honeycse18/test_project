import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/controllers/verification_controller.dart';
import 'package:test_project/utils/constants/app_gaps.dart';
import 'package:test_project/utils/constants/constant.dart';
import 'package:test_project/utils/constants/images.dart';
import 'package:test_project/widgets/core_widget.dart';

import '../../widgets/number_pad.dart';

class VerificationScreen extends StatelessWidget {
  final VerificationController controller = Get.put(VerificationController());

  VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  AppAssetImages.pinbackImage,
                  height: 574,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              children: [
                AppGaps.hGap40,
                Center(
                  child: Image.asset(
                    AppAssetImages.logoImage,
                    height: 104.99,
                    width: 105.08,
                  ),
                ),
                AppGaps.hGap21,
                Text(
                  AppConstants.enterPinText,
                  style: Theme.of(context).textTheme.displaySmall,
                ),

                AppGaps.hGap100,
                AppGaps.hGap30,
                // PIN Input Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Obx(() => PinInputField(
                        pin: controller.pinText.value,
                        onTap: controller.deleteNumber,
                      )),
                ),

                AppGaps.hGap26,
                // Number pad
                NumberPad(
                  onNumberPressed: controller.addNumber,
                  onDeletePressed: controller.deleteNumber,
                ),
                AppGaps.hGap24,
                // Confirm button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CustomButton(
                    btntext: AppConstants.confirmText,
                    ontap: controller.confirmPin,
                  ),
                ),

                // Resend PIN text
                TextButton(
                  onPressed: controller.resendPin,
                  child: Text(
                    AppConstants.resendPinText,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
