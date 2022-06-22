import 'package:daisy_recipe/app/data/models/user_model.dart';
import 'package:daisy_recipe/app/data/services/authentication_service.dart';
import 'package:daisy_recipe/app/routes/app_pages.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  //TODO: Implement AuthenticationController
  final formLoginKey = GlobalKey<FormState>();
  late TextEditingController usernameCtrl;
  late TextEditingController passwordCtrl;
  UserData? userData;
  bool toggleLoginEye = true;

  final count = 0.obs;
  var loading = false.obs;
  @override
  void onInit() {
    usernameCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  login() async {
    var form = formLoginKey.currentState;
    if (form!.validate()) {
      loading.value = true;
      try {
        final response = await AuthenticationService().login(
          username: usernameCtrl.text.trim(),
          password: passwordCtrl.text.trim()
        );
        userData = UserData.fromJson(response.data);
        loading.value = false;
        update();
        Get.offAllNamed(Routes.HOME);
      } on DioError catch (e) {
        loading.value = false;
      }
    }
  }

}
