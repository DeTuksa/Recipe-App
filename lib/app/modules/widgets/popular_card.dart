import 'package:daisy_recipe/app/data/constants/app_theme.dart';
import 'package:daisy_recipe/app/data/constants/asset_paths.dart';
import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/data/models/recipe_model.dart';
import 'package:daisy_recipe/app/modules/home/views/recipe_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PopularCard extends StatefulWidget {
  final Recipe recipe;
  const PopularCard({Key? key, required this.recipe}) : super(key: key);

  @override
  State<PopularCard> createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppSpacer.W10,
        GestureDetector(
          onTap: () => Get.to(RecipeDetailsView(recipe: widget.recipe)),
          child: SizedBox(
            height: 250,
            width: 150,
            child: Stack(
              children: [
                Positioned(
                  top: 55,
                  child: Container(
                    height: 175, width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFFF1F1F1)
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.recipe.title!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white
                              ),
                              height: 24, width: 24,
                              child: Center(
                                child: SvgPicture.asset(
                                  AssetPath.bookmarkInactive,
                                  color: Colors.black,
                                  height: 16, width: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Time',
                                    style: TextStyle(
                                      color: Color(0xFFC1C1C1)
                                    ),
                                  ),
                                  AppSpacer.H5,
                                  Text(
                                    '${widget.recipe.readyInMinutes} mins',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 110, height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      border: Border.all(color: const Color(0xFFF1F1F1), width: 4)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: widget.recipe.image != null ? Image.network(
                        widget.recipe.image!,
                        fit: BoxFit.fill,
                      ) : Container(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        AppSpacer.W10
      ],
    );
  }
}
