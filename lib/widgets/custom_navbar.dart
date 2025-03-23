import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:test_project/controllers/theme_controller.dart';
import 'package:test_project/controllers/wallet_controller.dart';
import 'package:test_project/utils/constants/colors.dart';
import 'package:test_project/utils/constants/images.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WalletController homeController = Get.find<WalletController>();
    final ThemeController themeController = Get.find<ThemeController>();

    return Container(
      decoration: BoxDecoration(
        color: themeController.isDarkMode.value
            ? AppColors.darkprimaryTextColor
            : Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: themeController.isDarkMode.value
                ? AppColors.signUpColor
                : AppColors.boxShadow2Color.withOpacity(0.3),
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      height: 67,
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavBarItem(
                icon: AppAssetImages.homeSVGLogoSolid,
                label: 'HOME',
                isSelected: homeController.currentTabIndex.value == 0,
                onTap: () => homeController.changeTab(0),
              ),
              NavBarItem(
                icon: AppAssetImages.groupSVGLogoSolid,
                label: 'CIRCLES',
                isSelected: homeController.currentTabIndex.value == 1,
                onTap: () => homeController.changeTab(1),
              ),
              NavBarItem(
                icon: AppAssetImages.notificationSVGLogoSolid,
                label: 'NOTIFICATION',
                isSelected: homeController.currentTabIndex.value == 2,
                onTap: () => homeController.changeTab(2),
              ),
              NavBarItem(
                icon: AppAssetImages.settingSVGLogoSolid,
                label: 'SETTINGS',
                isSelected: homeController.currentTabIndex.value == 3,
                onTap: () => homeController.changeTab(3),
              ),
            ],
          )),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavBarItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected
                  ? (themeController.isDarkMode.value
                      ? AppColors.iconBackground2
                      : AppColors.iconBackground)
                  : Colors.transparent,
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: 18,
                height: 18,
                color: isSelected ? AppColors.signUpColor : Colors.grey,
              ),
            ),
          ),
          if (!isSelected) // Only show the label if not selected
            Text(
              label,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }
}
