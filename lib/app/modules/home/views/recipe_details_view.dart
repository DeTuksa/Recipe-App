import 'package:daisy_recipe/app/data/constants/app_theme.dart';
import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/data/models/recipe_model.dart';
import 'package:daisy_recipe/app/modules/home/controllers/home_controller.dart';
import 'package:daisy_recipe/app/modules/widgets/ingredient_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RecipeDetailsView extends StatefulWidget {

  final Recipe recipe;

  const RecipeDetailsView({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeDetailsView> createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends State<RecipeDetailsView> {

  final homeController = Get.find<HomeController>();

  final tabs = <Tab>[
    const Tab(
      text: 'Ingredients',
    ),
    const Tab(
      text: 'Instructions',
    )
  ];

  @override
  void initState() {
    homeController.getRecipeBannerAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  /*SizedBox(
                    width: Get.width,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width * 0.7,
                          child: Text(
                            widget.recipe.title!,
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppSpacer.H20,*/
                  SizedBox(
                    width: Get.width, height: 250,
                    child: Hero(
                      tag: widget.recipe.id!,
                      child: ClipRRect(
                        child: widget.recipe.image != null ? Image.network(
                          widget.recipe.image!,
                          fit: BoxFit.fill,
                        ) : const SizedBox(),
                      ),
                    ),
                  ),
                  AppSpacer.H16,
                ],
              ),
            ),
            Container(
              child: DraggableScrollableSheet(
                initialChildSize: 0.75,
                minChildSize: 0.75,
                maxChildSize: 0.8,
                builder: (BuildContext context, myScrollController) {
                  return Material(
                    elevation: 12,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: DefaultTabController(
                        length: 2,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            AppSpacer.H32,
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: SizedBox(
                                child: Text(
                                  widget.recipe.title!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                            ),
                            AppSpacer.H32,
                            TabBar(
                              labelColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppTheme.primarySwatch.shade200
                              ),
                              unselectedLabelColor: Colors.black,
                              tabs: tabs,
                            ),
                            AppSpacer.H10,
                            if (homeController.bannerAdRecipeDetails != null)
                              Align(
                                alignment: Alignment.topCenter,
                                child: SizedBox(
                                  width: homeController.bannerAdRecipeDetails!.size.width.toDouble(),
                                  height: homeController.bannerAdRecipeDetails!.size.height.toDouble(),
                                  child: AdWidget(ad: homeController.bannerAdRecipeDetails!),
                                ),
                              ),
                            AppSpacer.H10,
                            Expanded(
                              child: TabBarView(
                                children: [
                                  IngredientsTab(myScrollController: myScrollController, recipe: widget.recipe),
                                  InstructionsTab(myScrollController: myScrollController, recipe: widget.recipe)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20, horizontal: 20
                ),
                child: InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back, color: Colors.black,),),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IngredientsTab extends StatefulWidget {
  final ScrollController myScrollController;
  final Recipe recipe;
  const IngredientsTab({Key? key, required this.myScrollController, required this.recipe}) : super(key: key);

  @override
  State<IngredientsTab> createState() => _IngredientsTabState();
}

class _IngredientsTabState extends State<IngredientsTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      physics: const BouncingScrollPhysics(),
      controller: widget.myScrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Health Score: ${widget.recipe.healthScore!}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Text(
                    '${widget.recipe.aggregateLikes ?? 0}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
            ],
          ),
          AppSpacer.H30,
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Ingredients',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),
              Text(
                '${widget.recipe.extendedIngredients?.length} items',
                style: const TextStyle(
                    color: AppTheme.notificationText,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
          AppSpacer.H20,
          ...List.generate(widget.recipe.extendedIngredients!.length, (index) => IngredientWidget(
            ingredients: widget.recipe.extendedIngredients![index],
          ))
        ],
      ),
    );
  }
}

class InstructionsTab extends StatefulWidget {
  final ScrollController myScrollController;
  final Recipe recipe;
  const InstructionsTab({Key? key, required this.myScrollController, required this.recipe}) : super(key: key);

  @override
  State<InstructionsTab> createState() => _InstructionsTabState();
}

class _InstructionsTabState extends State<InstructionsTab> {

  Widget parseHtmlData() {
    var htmlData = widget.recipe.instructions;
    return Html(
        data: htmlData,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      physics: const BouncingScrollPhysics(),
      controller: widget.myScrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Summary',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600
            ),
          ),
          AppSpacer.H10,
          /*SizedBox(
            child: Text(
              '${widget.recipe.instructions}',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
              ),
            ),
          ),*/
          SizedBox(
            child: parseHtmlData(),
          ),
          AppSpacer.H30,
        ],
      ),
    );
  }
}

