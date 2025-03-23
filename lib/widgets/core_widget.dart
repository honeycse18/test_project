import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/controllers/theme_controller.dart';
import 'package:test_project/utils/constants/app_gaps.dart';
import 'package:test_project/utils/constants/colors.dart';

class CustomScaffold extends StatelessWidget {
  PreferredSizeWidget? appBar;
  final Widget? body;
  Widget? bottomSheet;
  Color? backgroundColor;
  final bool resizeToAvoidBottomInset;

  CustomScaffold({
    super.key,
    this.appBar,
    this.body,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true, // Default value
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset, // Add this line
      appBar: appBar,
      body: SizedBox(
        height: screenHeight,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
                bottom: 0,
                child: Image.asset(
                  'assets/images/all_bottom_design.png',
                  fit: BoxFit.cover,
                )),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: screenWidth,
                    child: body,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: backgroundColor,
      bottomSheet: bottomSheet,
      key: key,
    );
  }
}

class CustomGradientButton extends StatelessWidget {
  final Function()? ontap;
  final String btntext;
  final ThemeController themeController = Get.find<ThemeController>();
  CustomGradientButton({required this.ontap, required this.btntext, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 321,
      height: 48,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF22DA70), Color(0xFF22C4AF)],
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: TextButton(
        onPressed: ontap,
        child: Text(btntext, style: Theme.of(context).textTheme.labelLarge),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Function()? ontap;
  final String btntext;
  final ThemeController themeController = Get.find<ThemeController>();
  CustomButton({required this.ontap, required this.btntext, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 321,
      height: 48,
      decoration: BoxDecoration(
        color: themeController.isDarkMode.value
            ? AppColors.darkprimaryTextColor
            : Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: TextButton(
        onPressed: ontap,
        child: Text(btntext,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: AppColors.primaryGradientEnd)),
      ),
    );
  }
}

class CustomGradientBorderTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final ThemeController themeController = Get.find<ThemeController>();

  CustomGradientBorderTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        gradient: const LinearGradient(
          colors: [Color(0xFF22DA70), Color(0xFF22B5DA)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Container(
        height: 48,
        margin: const EdgeInsets.all(1.0),
        decoration: BoxDecoration(
          color: themeController.isDarkMode.value
              ? AppColors.darkprimaryTextColor
              : Colors.white,
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          cursorColor: themeController.isDarkMode.value
              ? AppColors.darkprimaryTextColor
              : Colors.white,
          decoration: InputDecoration(
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelStyle: TextStyle(
                backgroundColor: themeController.isDarkMode.value
                    ? AppColors.darkprimaryTextColor
                    : Colors.white,
                color: Colors.grey,
                height: 0.1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.transparent,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          ),
        ),
      ),
    );
  }
}

class LogoCircleBackground extends StatelessWidget {
  final Widget img;

  LogoCircleBackground({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    return Container(
      height: 47,
      width: 47,
      decoration: BoxDecoration(
          color: themeController.isDarkMode.value
              ? AppColors.darkprimaryTextColor
              : Colors.white,
          shape: BoxShape.circle),
      child: Center(child: img),
    );
  }
}

class LogoBoxBackground extends StatelessWidget {
  final Widget img;
  final String text;

  LogoBoxBackground({super.key, required this.img, required this.text});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    return Column(
      children: [
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              color: themeController.isDarkMode.value
                  ? AppColors.darkprimaryTextColor
                  : Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: Center(child: img),
        ),
        AppGaps.hGap6,
        Text(
          text,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
