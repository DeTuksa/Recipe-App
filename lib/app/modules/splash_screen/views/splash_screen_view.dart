import 'package:daisy_recipe/app/data/constants/app_theme.dart';
import 'package:daisy_recipe/app/data/constants/asset_paths.dart';
import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/modules/authentication/views/login_view.dart';
import 'package:daisy_recipe/app/modules/authentication/views/signup_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashScreenController>(
        init: SplashScreenController(),
        builder: (ctrl) {
          return Stack(
            children: [
              SizedBox(
                width: Get.width,
                height: Get.height,
                child: Image.asset(
                  AssetPath.backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: Get.width,
                height: Get.height,
                color: const Color.fromRGBO(6, 9, 16, 0.6),
              ),
              /*Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(() => LoginView()),
                    child: Container(
                      width: Get.width * 0.8,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppTheme.primaryRed
                          ),
                          color: const Color.fromRGBO(6, 9, 16, 0.7)
                      ),
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),
                        ),
                      ),
                    ),
                  ),
                  AppSpacer.H16,
                  GestureDetector(
                    onTap: () => Get.to(() => SignupView()),
                    child: Container(
                      width: Get.width * 0.8,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppTheme.primaryRed
                      ),
                      child: const Center(
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )*/
            ],
          );
        },
      )
    );
  }
}
