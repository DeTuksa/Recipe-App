import 'dart:io';

import 'package:daisy_recipe/app/data/constants/app_theme.dart';
import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/data/helpers/shimmer_helper.dart';
import 'package:daisy_recipe/app/data/models/recipe_search_model.dart';
import 'package:daisy_recipe/app/modules/home/controllers/home_controller.dart';
import 'package:daisy_recipe/app/modules/home/views/all_recipes_view.dart';
import 'package:daisy_recipe/app/modules/home/views/search_view.dart';
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

  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children:  [
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                'Find best recipes\nfor cooking',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                ),
              ),
            ),
            AppSpacer.H20,
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: GestureDetector(
                onTap: () => showSearch(
                    context: Get.context!,
                    delegate: CustomSearchDelegate()
                ),
                child: SizedBox(
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
              ),
            ),
            AppSpacer.H30,
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
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
                  GestureDetector(
                    onTap: () => Get.to(const AllRecipesView()),
                    child: Row(
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
                    ),
                  )
                ],
              ),
            ),
            AppSpacer.H16,
            Obx(() => SizedBox(
              width: Get.width,
              height: 250,
              child: homeController.loadingRecipes.value ?
              ShimmerHelper().showTrendingShimmer() : homeController.recipeList.isEmpty ? const Center(
                child: Text(
                    'No data found'
                ),
              ) : ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return TrendingCard(
                    recipe: homeController.recipeList[index],
                  );
                },
              ),
            )),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                'Popular',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            AppSpacer.H16,
            Obx(() => SizedBox(
              width: Get.width,
              height: 250,
              child: homeController.loadingRecipes.value ?
              ShimmerHelper().showPopularShimmer() : homeController.recipeList.isEmpty ? const Center(
                child: Text(
                    'No data found'
                ),
              ) : ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return PopularCard(
                    recipe: homeController.recipeList.reversed.toList()[index],
                  );
                },
              ),
            )),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Cocktails',
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
            ),
            AppSpacer.H16,
            Obx(() => SizedBox(
              width: Get.width,
              height: 220,
              child: homeController.loadingCocktails.value ?
              ShimmerHelper().showCocktailShimmer() : homeController.cocktailList.isEmpty ? const Center(
                child: Text(
                  'No data found'
                ),
              ) : ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return RecentCard(
                    drink: homeController.cocktailList[index],
                  );
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}
