import 'dart:async';

import 'package:daisy_recipe/app/data/models/token_model.dart';
import 'package:daisy_recipe/app/data/storage/cached_data.dart';
import 'package:daisy_recipe/app/modules/home/bindings/home_binding.dart';
import 'package:daisy_recipe/app/modules/home/views/home_view.dart';
import 'package:daisy_recipe/app/modules/splash_screen/views/waiting_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController
  final CachedData _cachedData = CachedData();
  AccessTokenResponse? accessToken;

  @override
  void onInit() {
    startTime();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  navigationPage() async {
    accessToken = await _cachedData.getAuthTokenResponse();
    String? token = accessToken?.token;
    if(token != null && token.isNotEmpty) {
      Get.to(HomeView(), binding: HomeBinding());
    } else {
      Get.to(HomeView(), binding: HomeBinding());
    }
  }

  startTime() {
    var _duration = const Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }
}
