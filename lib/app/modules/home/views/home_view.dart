import 'dart:io';

import 'package:daisy_recipe/app/data/constants/app_colors.dart';
import 'package:daisy_recipe/app/data/constants/asset_paths.dart';
import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/modules/widgets/botoom_bar_icon.dart';
import 'package:daisy_recipe/app/modules/widgets/popular_card.dart';
import 'package:daisy_recipe/app/modules/widgets/recent_card.dart';
import 'package:daisy_recipe/app/modules/widgets/trending_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children:  [
            const Text(
              'Find best recipes\nfor cooking',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700
              ),
            ),
            AppSpacer.H20,
            SizedBox(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search recipes',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                  ),
                  prefixIcon: Icon(
                    Platform.isIOS ? CupertinoIcons.search : Icons.search,
                    size: 30,
                    color: Colors.grey,
                  ),
                  enabled: false
                ),
              ),
            ),
            AppSpacer.H30,
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Trending now 🔥',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColor.primaryRed
                      ),
                    ),
                    AppSpacer.W5,
                    Icon(
                      Platform.isIOS ?
                          Icons.arrow_forward_ios :
                          Icons.arrow_forward,
                      color: AppColor.primaryRed,
                    )
                  ],
                )
              ],
            ),
            AppSpacer.H16,
            SizedBox(
              width: Get.width - 40,
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const TrendingCard();
                },
              ),
            ),
            const Text(
              'Popular',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            AppSpacer.H16,
            SizedBox(
              width: Get.width - 40,
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const PopularCard();
                },
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Rcent recipe',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'See all',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColor.primaryRed
                      ),
                    ),
                    AppSpacer.W5,
                    Icon(
                      Platform.isIOS ?
                      Icons.arrow_forward_ios :
                      Icons.arrow_forward,
                      color: AppColor.primaryRed,
                    )
                  ],
                )
              ],
            ),
            AppSpacer.H16,
            SizedBox(
              width: Get.width - 40,
              height: 190,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const RecentCard();
                },
              ),
            ),
          ],
        ),
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
