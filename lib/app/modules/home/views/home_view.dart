import 'dart:io';

import 'package:daisy_recipe/app/data/constants/app_theme.dart';
import 'package:daisy_recipe/app/data/constants/asset_paths.dart';
import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/modules/widgets/botoom_bar_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {

  HomeView({Key? key}) : super(key: key);

  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (homeCtrl.bodyIndex.value == 0) {
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else if (Platform.isIOS) {
            exit(0);
          }
          return true;
        } else {
          homeCtrl.changeBodyIndex(0);
          return false;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (ctrl) {
            return ctrl.body[ctrl.bodyIndex.value];
          },
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Obx(() => CustomBottomItem(
                  asset: homeCtrl.bodyIndex.value == 0 ? AssetPath.homeActive : AssetPath.homeInactive,
                  function: () => homeCtrl.changeBodyIndex(0),
                )),
                Obx(() => CustomBottomItem(
                  asset: homeCtrl.bodyIndex.value == 1 ? AssetPath.bookmarkActive : AssetPath.bookmarkInactive,
                  function: () => homeCtrl.changeBodyIndex(1),
                )),
                AppSpacer.W10,
                Obx(() => CustomBottomItem(
                  asset: homeCtrl.bodyIndex.value == 2 ? AssetPath.notificationActive : AssetPath.notificationInactive,
                  function: () => homeCtrl.changeBodyIndex(2),
                )),
                Obx(() => CustomBottomItem(
                  asset: homeCtrl.bodyIndex.value == 3 ? AssetPath.profileActive : AssetPath.profileInactive,
                  function: () => homeCtrl.changeBodyIndex(3),
                ))
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppTheme.primaryRed,
          child: const Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
