import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/utils/constants/app_gaps.dart';
import 'package:test_project/utils/constants/colors.dart';
import 'package:test_project/utils/constants/images.dart';

class BalanceCard extends StatelessWidget {
  final String title;
  final String? balance;
  final String? subtitle;
  final IconData? icon;
  final bool isAddCard;
  final VoidCallback onTap;

  const BalanceCard({
    super.key,
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
        width: 117,
        height: 84,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: Offset(0, 4),
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
                    dashPattern: [3, 3],
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
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.signUpColor),
                  ),
                ],
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  clipBehavior: Clip.antiAlias,
                  children: [
                    Positioned(
                      top: -5,
                      right: -5,
                      child: Container(
                          height: 41.74,
                          width: 41.74,
                          decoration: BoxDecoration(
                            color: AppColors.iconBackground,
                            shape: BoxShape.circle,
                          ),
                          child:
                              Icon(icon, size: 20, color: Color(0xFF00C4B4))),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppGaps.hGap30,
                        Padding(
                          padding: const EdgeInsets.only(left: 11.0),
                          child: Text(
                            balance ?? '0.00',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: AppColors.primaryGradientStart),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 11.0),
                          child: Text(subtitle ?? '',
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      ],
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
