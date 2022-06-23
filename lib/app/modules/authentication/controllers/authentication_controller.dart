import 'package:daisy_recipe/app/data/models/token_model.dart';
import 'package:daisy_recipe/app/data/models/user_model.dart';
import 'package:daisy_recipe/app/data/services/authentication_service.dart';
import 'package:daisy_recipe/app/data/storage/cached_data.dart';
import 'package:daisy_recipe/app/routes/app_pages.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  //TODO: Implement AuthenticationController
  final formLoginKey = GlobalKey<FormState>();
  final formCreateKey = GlobalKey<FormState>();
  late TextEditingController usernameCtrl;
  late TextEditingController passwordCtrl;
  UserData? userData;
  bool toggleLoginEye = true;
  final CachedData _cachedData = CachedData();

  late TextEditingController nameController;
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool toggleCreate = true;

  final count = 0.obs;
  var loading = false.obs;
  @override
  void onInit() {
    usernameCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    nameController = TextEditingController();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
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
        await _cachedData.cacheAuthTokenResponse(accessTokenResponse: AccessTokenResponse(token: userData!.token)).whenComplete(() async {
          await _cachedData.cacheUserDetails(user: userData!.user).whenComplete(() => Get.offAllNamed(Routes.HOME));
        });
      } on DioError catch (e) {
        loading.value = false;
      }
    }
  }

  createUser() async {
    var form = formCreateKey.currentState;
    if (form!.validate()) {
      loading.value = true;
      try {
        final response = await AuthenticationService().createUser(
            username: usernameController.text.trim(),
            email: emailController.text.trim(),
            name: nameController.text.trim(),
            password: passwordController.text.trim()
        );
        userData = UserData.fromJson(response.data);
        loading.value = false;
        update();
        await _cachedData.cacheAuthTokenResponse(accessTokenResponse: AccessTokenResponse(token: userData!.token)).whenComplete(() async {
          await _cachedData.cacheUserDetails(user: userData!.user).whenComplete(() => Get.offAllNamed(Routes.HOME));
        });
      } on DioError catch (e) {
        loading.value = false;
      }
    }
  }
}
