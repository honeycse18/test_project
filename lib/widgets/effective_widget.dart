import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_project/controllers/theme_controller.dart';
import 'package:test_project/utils/constants/app_gaps.dart';
import 'package:test_project/utils/constants/colors.dart';

class EffectiveScoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Effective score',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: AppColors.primaryTextColor)),
          SizedBox(height: 12),
          Container(
            height: 54,
            decoration: BoxDecoration(
              color: themeController.isDarkMode.value
                  ? AppColors.darkprimaryTextColor
                  : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: themeController.isDarkMode.value
                      ? AppColors.signUpColor
                      : AppColors.boxShadow2Color.withOpacity(0.3),
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  AppGaps.hGap4,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ScoreIndicator(
                          text: 'Very Poor',
                          color: Colors.red,
                          showTriangle: false,
                        ),
                      ),
                      AppGaps.wGap4,
                      Expanded(
                        child: ScoreIndicator(
                          text: 'Poor',
                          color: Colors.orange,
                          showTriangle: false,
                        ),
                      ),
                      AppGaps.wGap4,
                      Expanded(
                        child: ScoreIndicator(
                          text: 'Fair',
                          color: Colors.yellow,
                          showTriangle: false,
                        ),
                      ),
                      AppGaps.wGap4,
                      Expanded(
                        child: ScoreIndicator(
                          text: 'Good',
                          color: Colors.green,
                          showTriangle: false,
                        ),
                      ),
                      AppGaps.wGap4,
                      Expanded(
                        child: ScoreIndicator(
                          text: 'Excellent',
                          color: Colors.teal,
                          showTriangle: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ScoreIndicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool showTriangle;

  const ScoreIndicator({
    Key? key,
    required this.color,
    required this.text,
    this.showTriangle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text,
            style: TextStyle(
                fontSize: 9,
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.w500)),
        AppGaps.hGap4,
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: 6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: color),
            ),
            if (showTriangle)
              Positioned(
                bottom: -16,
                child: Icon(
                  Icons.arrow_drop_up,
                  color: Color(0xFF00C4B4),
                  size: 20,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
