import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:test_project/controllers/theme_controller.dart';
import 'package:test_project/controllers/wallet_controller.dart';
import 'package:test_project/utils/constants/app_gaps.dart';
import 'package:test_project/utils/constants/colors.dart';
import 'package:test_project/utils/constants/images.dart';
import 'package:test_project/widgets/wallet_widget.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final NumberFormat currencyFormat;

  TransactionItem({
    super.key,
    required this.transaction,
    required this.currencyFormat,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    return Container(
        height: 48,
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
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: SvgPicture.asset(AppAssetImages.sentLogoLine),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.name,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryTextColor),
                    ),
                    AppGaps.hGap4,
                    Text(
                      transaction.payMethod,
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryTextColor),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${transaction.isSent ? '-' : '+'}${currencyFormat.format(transaction.amount)} USD",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: transaction.isSent ? Colors.red : Colors.green,
                    ),
                  ),
                  AppGaps.hGap4,
                  Text(
                    DateFormat("MMM dd, yyyy").format(transaction.date),
                    style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryTextColor),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class TransactionList extends StatelessWidget {
  final currencyFormat = NumberFormat("#,##0.00", "en_US");

  TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    final WalletController controller = Get.find<WalletController>();
    return Obx(
      () => ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemCount: controller.transactions.length,
        separatorBuilder: (context, index) => Divider(height: 10),
        itemBuilder: (context, index) {
          final transaction = controller.transactions[index];
          return TransactionItem(
            transaction: transaction,
            currencyFormat: currencyFormat,
          );
        },
      ),
    );
  }
}
