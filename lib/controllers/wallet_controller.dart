import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/screens/auth/forgot_password.dart';
import 'package:test_project/screens/auth/login.dart';
import 'package:test_project/screens/register/register.dart';
import 'package:test_project/screens/wallet.dart';
import 'package:test_project/widgets/card_dialog.dart';
import 'package:test_project/widgets/wallet_dialog.dart';
import 'package:test_project/widgets/wallet_widget.dart';

class WalletController extends GetxController {
  var currentTabIndex = 0.obs;

  // List of pages to show based on selected tab
  final pages = [
    WalletScreen(),
    WalletScreen(),
    WalletScreen(),
    WalletScreen(),
  ];

  void changeTab(int index) {
    currentTabIndex.value = index;
    update();
  }

  // Get current page based on tab index
  Widget get currentPage => pages[currentTabIndex.value];
  var balance = 0.0.obs;
  var effectiveScore = 'Good'.obs;
  var transactions = <Transaction>[].obs;
  var currencies = <WalletCurrency>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Load sample data
    loadTransactions();
    loadCurrencies();
  }

  void loadTransactions() {
    transactions.value = [
      Transaction(
          name: 'John Doe',
          amount: 2000.0,
          date: DateTime.now().subtract(Duration(days: 1)),
          isSent: true,
          payMethod: 'Sent'),
      Transaction(
        name: 'Jessica Sanders',
        amount: 1988.68,
        date: DateTime.now().subtract(Duration(days: 2)),
        isSent: false,
        payMethod: 'Received',
      ),
      Transaction(
          name: 'John Smith',
          amount: 2000.0,
          date: DateTime.now().subtract(Duration(days: 3)),
          isSent: true,
          payMethod: 'Sent'),
      Transaction(
        name: 'John Doe',
        amount: 1988.68,
        date: DateTime.now().subtract(Duration(days: 4)),
        isSent: false,
        payMethod: 'Received',
      ),
      Transaction(
        name: 'Grace Doe',
        amount: 2000.0,
        date: DateTime.now().subtract(Duration(days: 5)),
        isSent: true,
        payMethod: 'Sent',
      ),
      Transaction(
        name: 'John Smith',
        amount: 1988.68,
        date: DateTime.now().subtract(Duration(days: 6)),
        isSent: false,
        payMethod: 'Received',
      ),
      Transaction(
          name: 'John Doe',
          amount: 2000.0,
          date: DateTime.now().subtract(Duration(days: 7)),
          isSent: true,
          payMethod: 'Sent'),
    ];
  }

  void loadCurrencies() {
    currencies.value = [
      WalletCurrency(
        name: 'Australian Dollar',
        code: 'AUD',
        flagAsset: 'assets/flags/au.png',
        description: 'Australian Dollar',
      ),
      WalletCurrency(
        name: 'British Pound',
        code: 'GBP',
        flagAsset: 'assets/flags/gb.png',
        description: 'British Pound',
      ),
      WalletCurrency(
        name: 'New Zealand Dollar',
        code: 'NZD',
        flagAsset: 'assets/flags/nz.png',
        description: 'New Zealand Dollar',
      ),
      WalletCurrency(
        name: 'Singapore Dollar',
        code: 'SGD',
        flagAsset: 'assets/flags/sg.png',
        description: 'Singapore Dollar',
      ),
      WalletCurrency(
        name: 'Australian Dollar',
        code: 'AUD',
        flagAsset: 'assets/flags/au.png',
        description: 'Australian Dollar',
      ),
      WalletCurrency(
        name: 'British Pound',
        code: 'GBP',
        flagAsset: 'assets/flags/gb.png',
        description: 'British Pound',
      ),
      WalletCurrency(
        name: 'New Zealand Dollar',
        code: 'NZD',
        flagAsset: 'assets/flags/nz.png',
        description: 'New Zealand Dollar',
      ),
      WalletCurrency(
        name: 'Singapore Dollar',
        code: 'SGD',
        flagAsset: 'assets/flags/sg.png',
        description: 'Singapore Dollar',
      ),
    ];
  }

  void openNewWallet() {
    Get.dialog(
      NewWalletDialog(),
      barrierDismissible: true,
    );
  }

  void openNewCad() {
    Get.dialog(
      NewCardDialog(),
      barrierDismissible: true,
    );
  }
}
