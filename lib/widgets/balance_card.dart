import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/utils/constants/colors.dart';
import 'package:test_project/utils/constants/images.dart';

class BalanceCard extends StatelessWidget {
  final String title;
  final String? balance;
  final String? subtitle;
  final IconData? icon;
  final bool isAddCard;
  final VoidCallback onTap;

  BalanceCard({
    required this.title,
    this.balance,
    this.subtitle,
    this.icon,
    this.isAddCard = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: isAddCard
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DottedBorder(
                    color: AppColors.signUpColor,
                    borderType: BorderType.RRect,
                    strokeWidth: 1,
                    dashPattern: [4, 4],
                    radius: Radius.circular(40.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.iconBackground),
                            child: Center(
                              child: SvgPicture.asset(
                                AppAssetImages.addSVGLogoSolid,
                              ),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 41.74,
                      width: 41.74,
                      decoration: BoxDecoration(
                        color: AppColors.iconBackground,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(icon, size: 20, color: Color(0xFF00C4B4))),
                  SizedBox(height: 4),
                  SizedBox(height: 4),
                  Text(
                    balance ?? '0.00',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle ?? '',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
