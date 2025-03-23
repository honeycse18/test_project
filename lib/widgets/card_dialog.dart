import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_project/controllers/theme_controller.dart';
import 'package:test_project/controllers/wallet_controller.dart';
import 'package:test_project/utils/constants/app_gaps.dart';
import 'package:test_project/utils/constants/colors.dart';
import 'package:test_project/utils/constants/images.dart';
import 'package:test_project/widgets/core_widget.dart';
import 'package:test_project/widgets/transaction_widget.dart';
import 'package:test_project/widgets/wallet_widget.dart';

class NewCardDialog extends StatelessWidget {
  NewCardDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final WalletController controller = Get.find<WalletController>();
    final ThemeController themeController = Get.find<ThemeController>();
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(23), // Increased border radius to 100
      ),
      child: Container(
        height: 630,
        padding: EdgeInsets.symmetric(vertical: 0),
        child: Column(
          children: [
            Container(
              height: 203,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                gradient: const LinearGradient(
                  colors: [
                    AppColors.signUpColor,
                    AppColors.primaryGradientStart,
                    AppColors.primaryGradientMiddle,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 23, right: 23, top: 35),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.iconBackground,
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/usa.png',
                                  height: 44,
                                  width: 44,
                                ),
                              ),
                            ),
                            AppGaps.wGap10,
                            AppGaps.wGap3,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Us Dollar',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: themeController.isDarkMode.value
                                        ? AppColors.darkprimaryTextColor
                                        : Colors.white,
                                  ),
                                ),
                                AppGaps.hGap9,
                                Text(
                                  '\$ 9,8765.00',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: themeController.isDarkMode.value
                                        ? AppColors.darkprimaryTextColor
                                        : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Icon(
                          Icons.more_vert,
                          color: themeController.isDarkMode.value
                              ? AppColors.darkprimaryTextColor
                              : Colors.white,
                        ),
                      ],
                    ),
                    AppGaps.hGap25,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LogoBoxBackground(
                          img: Icon(
                            Icons.add,
                            color: AppColors.signUpColor,
                          ),
                          text: 'Add',
                        ),
                        LogoBoxBackground(
                          img: Icon(
                            Icons.loop,
                            color: AppColors.signUpColor,
                          ),
                          text: 'Covert',
                        ),
                        LogoBoxBackground(
                          img: SvgPicture.asset(
                            AppAssetImages.sentLogoLine,
                            width: 19.63,
                            height: 16,
                          ),
                          text: 'Send',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  AppGaps.hGap19,
                  Container(
                    height: 45,
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
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.signUpColor,
                        ),
                        border: InputBorder.none,
                        hintText: 'USD Activity',
                        hintStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFC4C4C4)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: TransactionList(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: TextButton(
                onPressed: () => Get.back(),
                child: Text(
                  'Tap to close',
                  style: TextStyle(
                    color: AppColors.signUpColor,
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
