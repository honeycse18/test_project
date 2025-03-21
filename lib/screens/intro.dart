import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:test_project/controllers/intro_controller.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IntroController>(
        global: false,
        init: IntroController(),
        builder: (controller) => Scaffold(
              body: Center(
                child: Text('Hello'),
              ),
            ));
  }
}
