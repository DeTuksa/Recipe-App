import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/data/models/recipe_model.dart';
import 'package:daisy_recipe/app/modules/home/views/recipe_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllRecipesWidget extends StatefulWidget {

  final Recipe recipe;

  const AllRecipesWidget({Key? key, required this.recipe}) : super(key: key);

  @override
  State<AllRecipesWidget> createState() => _AllRecipesWidgetState();
}

class _AllRecipesWidgetState extends State<AllRecipesWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(RecipeDetailsView(recipe: widget.recipe)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: 200, width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      width: Get.width, height: 200,
                      child: Hero(
                        tag: widget.recipe.id!,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: widget.recipe.image != null ? Image.network(
                            widget.recipe.image!,
                            fit: BoxFit.fill,
                          ) : const SizedBox(),
                        ),
                      ),
                    ),
                    /*Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white
                          ),
                          height: 32, width: 32,
                          child: Center(
                            child: SvgPicture.asset(
                              AssetPath.bookmarkInactive,
                              color: Colors.black,
                              height: 20, width: 20,
                            ),
                          ),
                        ),
                      ),
                    ),*/
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          width: 120, height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFF303030).withOpacity(0.3)
                          ),
                          child: Center(
                            child: Text(
                              'Health Score: ${widget.recipe.healthScore!}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12
                              ),
                            ),
                          ),
                        ),
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
              AppSpacer.H5,
              Container(
                width: Get.width,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Get.width * 0.6,
                      child: Text(
                        widget.recipe.title!,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    const Icon(
                        Icons.more_horiz
                    )
                  ],
                ),
              ),
              AppSpacer.H20,
            ],
          ),
        ),
      ),
    );
  }
}
