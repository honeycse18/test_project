import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/controllers/theme_controller.dart';
import 'package:test_project/controllers/wallet_controller.dart';
import 'package:test_project/utils/constants/app_gaps.dart';
import 'package:test_project/utils/constants/colors.dart';
import 'package:test_project/utils/constants/constant.dart';
import 'package:test_project/widgets/wallet_widget.dart';

class NewWalletDialog extends StatelessWidget {
  NewWalletDialog({super.key});

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
        height: 600, // Set fixed height to 500
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(
                    'Open new wallet',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppGaps.hGap16,
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
                          blurRadius: 2,
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
                        hintText: 'Search',
                        hintStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFC4C4C4)),
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: controller.currencies.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      AppGaps.hGap10,
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: CurrencyItem(
                          currency: controller.currencies[index],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: TextButton(
                onPressed: () => Get.back(),
                child: Text(
                  AppConstants.tapToCloseText,
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
