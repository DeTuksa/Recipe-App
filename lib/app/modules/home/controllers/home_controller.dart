import 'package:daisy_recipe/app/modules/home/views/home_tab_view.dart';
import 'package:daisy_recipe/app/modules/home/views/notification_tab_view.dart';
import 'package:daisy_recipe/app/modules/home/views/profile_tab_view.dart';
import 'package:daisy_recipe/app/modules/home/views/saved_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  List<Widget> body = <Widget>[
    const HomeTabView(),
    const SavedTabView(),
    const NotificationTabView(),
    const ProfileTabView()
  ];
  var bodyIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  changeBodyIndex(int newIndex) {
    bodyIndex.value = newIndex;
    update();
  }
}
