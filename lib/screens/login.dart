import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:test_project/controllers/login_controller.dart';
import 'package:test_project/utils/constants/app_gaps.dart';
import 'package:test_project/utils/constants/constant.dart';
import 'package:test_project/utils/constants/images.dart';
import 'package:test_project/widgets/core_widget.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        global: false,
        init: LoginController(),
        builder: (controller) => CustomScaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    AppGaps.hGap45,
                    Center(
                      child: Image.asset(
                        AppAssetImages.logoImage,
                        height: 104.99,
                        width: 105.08,
                      ),
                    ),
                    AppGaps.hGap24,
                    Text(
                      AppConstants.loginText,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
              ),
            ));
  }
}
