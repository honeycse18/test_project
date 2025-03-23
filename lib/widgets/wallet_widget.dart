import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Transaction {
  final String name;
  final String profileImage;
  final double amount;
  final DateTime date;
  final bool isSent;

  Transaction({
    required this.name,
    required this.profileImage,
    required this.amount,
    required this.date,
    required this.isSent,
  });
}

class WalletCurrency {
  final String name;
  final String code;
  final String flagAsset;
  final String description;

  WalletCurrency({
    required this.name,
    required this.code,
    required this.flagAsset,
    required this.description,
  });
}

class CurrencyItem extends StatelessWidget {
  final WalletCurrency currency;

  CurrencyItem({
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue.withOpacity(0.1),
        ),
        child: Center(
          child: Text(
            currency.code.substring(0, 1),
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      title: Text(
        currency.name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        currency.description,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
      trailing: Text(
        'Tap to open',
        style: TextStyle(
          color: Color(0xFF00C4B4),
          fontSize: 12,
        ),
      ),
      onTap: () => Get.back(),
    );
  }
}
