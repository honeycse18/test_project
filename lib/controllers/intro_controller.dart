import 'dart:async';

import 'package:get/get.dart';

class IntroController extends GetxController {
  Future<void> authenticate() async {}

  //Swipe button

  RxDouble position = 0.0.obs;
  RxDouble swipeIndicatorOffset = 0.0.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    // Start the animation for the swipe indicator
    _startSwipeIndicatorAnimation();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void _startSwipeIndicatorAnimation() {
    bool goingUp = true;
    _timer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      if (goingUp) {
        swipeIndicatorOffset.value -= 0.5;
        if (swipeIndicatorOffset.value <= -15) {
          goingUp = false;
        }
      } else {
        swipeIndicatorOffset.value += 0.5;
        if (swipeIndicatorOffset.value >= 0) {
          goingUp = true;
        }
      }
    });
  }

  void updatePosition(double newPosition) {
    position.value = newPosition;
  }

  void resetPosition() {
    position.value = 0;
  }
}
