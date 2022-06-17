import 'package:daisy_recipe/app/data/constants/app_colors.dart';
import 'package:daisy_recipe/app/data/constants/asset_paths.dart';
import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/modules/widgets/botoom_bar_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {

  HomeView({Key? key}) : super(key: key);

  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (ctrl) {
          return ctrl.body[ctrl.bodyIndex];
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
              CustomBottomItem(
                asset: AssetPath.homeActive,
                function: () => homeCtrl.changeBodyIndex(0),
              ),
              CustomBottomItem(
                asset: AssetPath.bookmarkInactive,
                function: () => homeCtrl.changeBodyIndex(1),
              ),
              AppSpacer.W10,
              CustomBottomItem(
                asset: AssetPath.notificationInactive,
                function: () => homeCtrl.changeBodyIndex(2),
              ),
              CustomBottomItem(
                asset: AssetPath.profileInactive,
                function: () => homeCtrl.changeBodyIndex(3),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColor.primaryRed,
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
