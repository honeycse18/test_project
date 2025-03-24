import 'package:get/get.dart';

class VerificationController extends GetxController {
  final pinText = ''.obs;

  void addNumber(String number) {
    if (pinText.value.length < 4) {
      pinText.value += number;
    }
  }

  void deleteNumber() {
    if (pinText.value.isNotEmpty) {
      pinText.value = pinText.value.substring(0, pinText.value.length - 1);
    }
  }

  void confirmPin() {
    Get.snackbar('PIN Submitted', 'Your PIN: ${pinText.value}');
  }

  void resendPin() {
    Get.snackbar('PIN Resent', 'A new PIN has been sent');
  }
}
