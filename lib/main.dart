import 'package:daisy_recipe/app/data/constants/app_theme.dart';
import 'package:daisy_recipe/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:daisy_recipe/app/notification_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

import 'app/modules/home/controllers/home_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  Get.lazyPut<HomeController>(()=> HomeController(), fenix: true);
  Get.put(AuthenticationController());
  runApp(MyApp(),);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: GetBuilder<NotificationController>(
          init: NotificationController(),
          builder: (ctrl) {
            return GetMaterialApp(
              title: "Application",
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.theme,
            );
          }
        ),
      )
    );
  }
}

