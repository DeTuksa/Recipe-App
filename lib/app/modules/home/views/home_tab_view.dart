import 'dart:io';

import 'package:daisy_recipe/app/data/constants/app_theme.dart';
import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/modules/widgets/popular_card.dart';
import 'package:daisy_recipe/app/modules/widgets/recent_card.dart';
import 'package:daisy_recipe/app/modules/widgets/trending_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
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
                          color: AppTheme.primaryRed
                      ),
                    ),
                    AppSpacer.W5,
                    Icon(
                      Platform.isIOS ?
                      Icons.arrow_forward_ios :
                      Icons.arrow_forward,
                      color: AppTheme.primaryRed,
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
                          color: AppTheme.primaryRed
                      ),
                    ),
                    AppSpacer.W5,
                    Icon(
                      Platform.isIOS ?
                      Icons.arrow_forward_ios :
                      Icons.arrow_forward,
                      color: AppTheme.primaryRed,
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
    );
  }
}
