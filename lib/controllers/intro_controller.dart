import 'package:get/get.dart';

class IntroController extends GetxController {
  Future<void> authenticate() async {}

  //Swipe button

  RxDouble position = 0.0.obs;

  void updatePosition(double newPosition) {
    position.value = newPosition;
  }

  void resetPosition() {
    position.value = 0.0;
  }
}
