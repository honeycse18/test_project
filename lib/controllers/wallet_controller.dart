import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_project/widgets/wallet_dialog.dart';
import 'package:test_project/widgets/wallet_widget.dart';

class WalletController extends GetxController {
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
        profileImage: 'assets/images/profile.png',
        amount: 2000.0,
        date: DateTime.now().subtract(Duration(days: 1)),
        isSent: true,
      ),
      Transaction(
        name: 'Jessica Sanders',
        profileImage: 'assets/images/profile.png',
        amount: 1988.68,
        date: DateTime.now().subtract(Duration(days: 2)),
        isSent: false,
      ),
      Transaction(
        name: 'John Smith',
        profileImage: 'assets/images/profile.png',
        amount: 2000.0,
        date: DateTime.now().subtract(Duration(days: 3)),
        isSent: true,
      ),
      Transaction(
        name: 'John Doe',
        profileImage: 'assets/images/profile.png',
        amount: 1988.68,
        date: DateTime.now().subtract(Duration(days: 4)),
        isSent: false,
      ),
      Transaction(
        name: 'Grace Doe',
        profileImage: 'assets/images/profile.png',
        amount: 2000.0,
        date: DateTime.now().subtract(Duration(days: 5)),
        isSent: true,
      ),
      Transaction(
        name: 'John Smith',
        profileImage: 'assets/images/profile.png',
        amount: 1988.68,
        date: DateTime.now().subtract(Duration(days: 6)),
        isSent: false,
      ),
      Transaction(
        name: 'John Doe',
        profileImage: 'assets/images/profile.png',
        amount: 2000.0,
        date: DateTime.now().subtract(Duration(days: 7)),
        isSent: true,
      ),
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
}
