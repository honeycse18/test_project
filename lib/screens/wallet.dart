import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:test_project/controllers/theme_controller.dart';
import 'package:test_project/controllers/wallet_controller.dart';
import 'package:test_project/utils/constants/app_gaps.dart';
import 'package:test_project/utils/constants/colors.dart';
import 'package:test_project/utils/constants/images.dart';
import 'package:test_project/widgets/balance_card.dart';
import 'package:test_project/widgets/custom_navbar.dart';
import 'package:test_project/widgets/effective_widget.dart';
import 'package:test_project/widgets/transaction_widget.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return GetBuilder<WalletController>(
        global: false,
        init: WalletController(),
        builder: (controller) => Scaffold(
              body: Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        AppAssetImages.topBackImage,
                        width: double.infinity,
                        height: 139.26,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      AppGaps.hGap34,
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 11, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BalanceCard(
                              title: '',
                              balance: '0.00',
                              subtitle: 'Euro',
                              icon: Icons.euro_rounded,
                              onTap: () => controller.openNewCad(),
                            ),
                            BalanceCard(
                              title: '',
                              balance: '0.00',
                              subtitle: 'Us Dollar',
                              icon: Icons.attach_money,
                              onTap: () => controller.openNewCad(),
                            ),
                            BalanceCard(
                              title: 'Open New Wallet',
                              isAddCard: true,
                              onTap: () => controller.openNewWallet(),
                            ),
                          ],
                        ),
                      ),
                      AppGaps.hGap17,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Effective Score
                            EffectiveScoreWidget(),

                            // Transaction list
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 11, bottom: 14),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Last Activity',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                              color:
                                                  AppColors.primaryTextColor)),
                                  Icon(
                                    Icons.more_vert,
                                    color: AppColors.primaryTextColor,
                                  ),
                                ],
                              ),
                            ),

                            // Transaction list
                            Expanded(
                              child: TransactionList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              bottomNavigationBar: CustomBottomNavBar(),
            ));
  }
}
