import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:test_project/controllers/login_controller.dart';
import 'package:test_project/controllers/wallet_controller.dart';
import 'package:test_project/widgets/balance_card.dart';
import 'package:test_project/widgets/custom_navbar.dart';
import 'package:test_project/widgets/effective_widget.dart';
import 'package:test_project/widgets/transaction_widget.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
        global: false,
        init: WalletController(),
        builder: (controller) => Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    // Top section with balance cards
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BalanceCard(
                            title: 'GLO',
                            balance: '0.00',
                            subtitle: 'USDT',
                            icon: Icons.euro_rounded,
                            onTap: () {},
                          ),
                          BalanceCard(
                            title: 'GLO',
                            balance: '0.00',
                            subtitle: 'USDT',
                            icon: Icons.attach_money,
                            onTap: () {},
                          ),
                          BalanceCard(
                            title: 'Open New Wallet',
                            isAddCard: true,
                            onTap: () => controller.openNewWallet(),
                          ),
                        ],
                      ),
                    ),

                    // Main content area with white background
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Effective Score
                            EffectiveScoreWidget(),

                            // Transaction list
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Last Activity',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(Icons.more_vert),
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
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: CustomBottomNavBar(),
            ));
  }
}
