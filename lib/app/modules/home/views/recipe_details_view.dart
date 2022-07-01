import 'package:daisy_recipe/app/data/constants/app_theme.dart';
import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/data/models/recipe_model.dart';
import 'package:daisy_recipe/app/modules/widgets/ingredient_widget.dart';
import 'package:daisy_recipe/app/modules/widgets/instruction_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecipeDetailsView extends StatefulWidget {

  final Recipe recipe;

  const RecipeDetailsView({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeDetailsView> createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends State<RecipeDetailsView> {

  final tabs = <Tab>[
    const Tab(
      text: 'Ingredients',
    ),
    const Tab(
      text: 'Instructions',
    )
  ];

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
                    child: ClipRRect(
                      child: widget.recipe.image != null ? Image.network(
                        widget.recipe.image!,
                        fit: BoxFit.fill,
                      ) : const SizedBox(),
                    ),
                  ),
                  AppSpacer.H16,
                ],
              ),
            ),
            Container(
              child: DraggableScrollableSheet(
                initialChildSize: 0.7,
                minChildSize: 0.7,
                maxChildSize: 0.9,
                builder: (BuildContext context, myScrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AppSpacer.H16,
                          TabBar(
                            indicatorColor: Colors.white,
                            labelColor: Colors.black,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppTheme.primarySwatch.shade50
                            ),
                            tabs: tabs,

                          ),
                          /*Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                                decoration: BoxDecoration(
                                    color: AppTheme.primarySwatch.shade50,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: const Center(
                                  child: Text(
                                    'Ingredients',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                                decoration: BoxDecoration(
                                    color: AppTheme.notificationBackground,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: const Center(
                                  child: Text(
                                    'Instructions',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),*/
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
          SizedBox(
            child: Text(
              '${widget.recipe.instructions}',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
              ),
            ),
          ),
          AppSpacer.H30,
          /*Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Steps',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),
              Text(
                '${widget.recipe.analyzedInstructions?.length} step(s)',
                style: const TextStyle(
                    color: AppTheme.notificationText,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),
              ),
            ],
          )*/
        ],
      ),
    );
  }
}

