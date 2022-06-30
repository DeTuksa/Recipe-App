import 'package:daisy_recipe/app/data/constants/app_theme.dart';
import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/data/models/recipe_model.dart';
import 'package:daisy_recipe/app/modules/widgets/ingredient_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecipeDetailsView extends StatefulWidget {

  final Recipe recipe;

  const RecipeDetailsView({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeDetailsView> createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends State<RecipeDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: ()=> Get.back(),
          child: const Icon(Icons.arrow_back, color: Colors.black,),),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
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
                  AppSpacer.H20,
                  Container(
                    height: 200, width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: Get.width, height: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: widget.recipe.image != null ? Image.network(
                              widget.recipe.image!,
                              fit: BoxFit.fill,
                            ) : const SizedBox(),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              width: 60, height: 26,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xFF303030).withOpacity(0.3)
                              ),
                              child: Center(
                                child: Text(
                                  '${widget.recipe.readyInMinutes} mins',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  AppSpacer.H16,
                ],
              ),
            ),
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
      ),
    );
  }
}
