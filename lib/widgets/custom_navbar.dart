import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/utils/constants/images.dart';

class CustomBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavBarItem(
              icon: AppAssetImages.homeSVGLogoSolid,
              label: 'HOME',
              isSelected: true),
          NavBarItem(icon: AppAssetImages.groupSVGLogoSolid, label: 'CIRCLES'),
          NavBarItem(
              icon: AppAssetImages.notificationSVGLogoSolid,
              label: 'NOTIFICATION'),
          NavBarItem(
              icon: AppAssetImages.settingSVGLogoSolid, label: 'SETTINGS'),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;

  NavBarItem({
    required this.icon,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          width: 24,
          height: 24,
          color: isSelected ? Color(0xFF00C4B4) : Colors.grey,
        ),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? Color(0xFF00C4B4) : Colors.grey,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
