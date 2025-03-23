import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flag/flag.dart';
import 'package:test_project/controllers/theme_controller.dart';
import 'package:test_project/utils/constants/colors.dart';

class Transaction {
  final String name;
  final String payMethod;
  final double amount;
  final DateTime date;
  final bool isSent;

  Transaction({
    required this.name,
    required this.payMethod,
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
  const CurrencyItem({
    super.key,
    required this.currency,
  });

  // Helper method to get country code from currency code
  String _getCountryCode(String currencyCode) {
    // Map currency codes to country codes (ISO 3166-1 alpha-2)
    switch (currencyCode) {
      case 'AUD':
        return 'AU'; // Australian Dollar
      case 'GBP':
        return 'GB'; // British Pound
      case 'NZD':
        return 'NZ'; // New Zealand Dollar
      case 'SGD':
        return 'SG'; // Singapore Dollar
      // Add more currency to country mappings as needed
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    final countryCode = _getCountryCode(currency.code);

    return Container(
      height: 48, // Increased height for better spacing
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
      // Replace ListTile with Row for better control over layout
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
          children: [
            // Left section with flag and text
            Row(
              children: [
                // Flag container
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: themeController.isDarkMode.value
                        ? AppColors.iconBackground2
                        : AppColors.iconBackground,
                  ),
                  child: Center(
                    child: countryCode.isNotEmpty
                        ? Flag.fromString(
                            countryCode,
                            height: 26,
                            width: 26,
                            fit: BoxFit.cover,
                            borderRadius: 15,
                          )
                        : Container(
                            width: 26,
                            height: 26,
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
                  ),
                ),
                SizedBox(width: 12), // Space between flag and text
                // Currency information
                Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center vertically
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currency.name,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryTextColor),
                    ),
                    SizedBox(
                        height: 2), // Small space between title and subtitle
                    Text(
                      currency.description,
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryTextColor),
                    ),
                  ],
                ),
              ],
            ),
            // Right section with 'Tap to open' text
            GestureDetector(
              onTap: () => Get.back(),
              child: Text(
                'Tap to open',
                style: TextStyle(
                  color: AppColors.signUpColor,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
