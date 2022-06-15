import 'package:daisy_recipe/app/data/constants/app_colors.dart';
import 'package:daisy_recipe/app/data/constants/asset_paths.dart';
import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/modules/widgets/botoom_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [],
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
                function: () {},
              ),
              CustomBottomItem(
                asset: AssetPath.bookmarkInactive,
                function: () {},
              ),
              AppSpacer.W10,
              CustomBottomItem(
                asset: AssetPath.notificationInactive,
                function: () {},
              ),
              CustomBottomItem(
                asset: AssetPath.profileInactive,
                function: () {},
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
