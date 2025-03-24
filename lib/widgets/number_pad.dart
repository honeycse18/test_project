import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_project/controllers/theme_controller.dart';
import 'package:test_project/utils/constants/app_gaps.dart';
import 'package:test_project/utils/constants/colors.dart';

class PinInputField extends StatelessWidget {
  final String pin;
  final Function() onTap;

  PinInputField({
    super.key,
    required this.pin,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return Container(
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(
            color: themeController.isDarkMode.value
                ? AppColors.darkprimaryTextColor
                : Colors.white,
            width: 1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: List.generate(
                4,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index < pin.length
                        ? AppColors.primaryTextColor
                        : Colors.transparent,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 2.0),
              child: InkWell(
                onTap: onTap,
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: themeController.isDarkMode.value
                          ? AppColors.darkprimaryTextColor
                          : Colors.white),
                  child: const Icon(
                    Icons.backspace_outlined,
                    color: Colors.red,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NumberPad extends StatelessWidget {
  final Function(String) onNumberPressed;
  final Function() onDeletePressed;

  const NumberPad({
    super.key,
    required this.onNumberPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumberButton(number: '1', onPressed: onNumberPressed),
            const SizedBox(width: 20),
            NumberButton(number: '2', onPressed: onNumberPressed),
            const SizedBox(width: 20),
            NumberButton(number: '3', onPressed: onNumberPressed),
          ],
        ),
        AppGaps.hGap20,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumberButton(number: '4', onPressed: onNumberPressed),
            const SizedBox(width: 20),
            NumberButton(number: '5', onPressed: onNumberPressed),
            const SizedBox(width: 20),
            NumberButton(number: '6', onPressed: onNumberPressed),
          ],
        ),
        AppGaps.hGap20,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumberButton(number: '7', onPressed: onNumberPressed),
            const SizedBox(width: 20),
            NumberButton(number: '8', onPressed: onNumberPressed),
            const SizedBox(width: 20),
            NumberButton(number: '9', onPressed: onNumberPressed),
          ],
        ),
        AppGaps.hGap20,
        NumberButton(number: '0', onPressed: onNumberPressed),
      ],
    );
  }
}

class NumberButton extends StatelessWidget {
  final String number;
  final Function(String) onPressed;
  final ThemeController themeController = Get.find<ThemeController>();

  NumberButton({
    super.key,
    required this.number,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(number),
      customBorder: const CircleBorder(),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: themeController.isDarkMode.value
                  ? AppColors.darkprimaryTextColor
                  : Colors.white,
              width: 1),
        ),
        child: Center(
          child: Text(
            number,
            style: TextStyle(
              color: themeController.isDarkMode.value
                  ? AppColors.darkprimaryTextColor
                  : Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
