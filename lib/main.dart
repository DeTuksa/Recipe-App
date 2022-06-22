import 'package:daisy_recipe/app/data/constants/app_theme.dart';
import 'package:daisy_recipe/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/modules/home/controllers/home_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  Get.lazyPut<HomeController>(()=> HomeController(), fenix: true);
  Get.put(AuthenticationController());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
    ),
  );
}
