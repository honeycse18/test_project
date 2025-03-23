import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:test_project/controllers/wallet_controller.dart';
import 'package:test_project/widgets/wallet_widget.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final NumberFormat currencyFormat;

  TransactionItem({
    required this.transaction,
    required this.currencyFormat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                transaction.name.substring(0, 2),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
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
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Sent",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
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
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: transaction.isSent ? Colors.red : Colors.green,
                ),
              ),
              Text(
                DateFormat("MMM dd, yyyy").format(transaction.date),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TransactionList extends StatelessWidget {
  final WalletController controller = Get.find<WalletController>();
  final currencyFormat = NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: controller.transactions.length,
        separatorBuilder: (context, index) => Divider(height: 1),
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
