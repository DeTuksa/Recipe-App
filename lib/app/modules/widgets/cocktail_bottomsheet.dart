import 'package:daisy_recipe/app/data/constants/app_theme.dart';
import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/data/models/cocktail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CocktailBottomSheet extends StatefulWidget {

  final Drink cocktail;
  const CocktailBottomSheet({Key? key, required this.cocktail}) : super(key: key);

  @override
  State<CocktailBottomSheet> createState() => _CocktailBottomSheetState();
}

class _CocktailBottomSheetState extends State<CocktailBottomSheet> {

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 4,
      child: Container(
        // height: Get.height * 0.6,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Text(
                    'Close',
                    style: TextStyle(
                      color: AppTheme.primarySwatch.shade600,
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                    ),
                  ),
                ),
              ),
              AppSpacer.H20,
              Center(
                child: Container(
                  height: 120, width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Hero(
                    tag: widget.cocktail.idDrink!,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        widget.cocktail.strDrinkThumb!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              AppSpacer.H10,
              Text(
                widget.cocktail.strDrink,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18
                ),
              ),
              AppSpacer.H10,
              Text(
                '(${widget.cocktail.strAlcoholic ?? 'Non-Alcoholic'})',
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16
                ),
              ),
              AppSpacer.H10,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Category:',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                    ),
                  ),
                  AppSpacer.W16,
                  Text(
                    widget.cocktail.strCategory!,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      color: AppTheme.primarySwatch.shade600
                    ),
                  ),
                ],
              ),
              AppSpacer.H10,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Drink Glass:',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                    ),
                  ),
                  AppSpacer.W16,
                  Text(
                    widget.cocktail.strGlass!,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppTheme.primarySwatch.shade600
                    ),
                  ),
                ],
              ),
              AppSpacer.H16,
              AppSpacer.H16,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                width: Get.width,
                decoration: BoxDecoration(
                  color: AppTheme.notificationBackground,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ingredients',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    AppSpacer.H10,
                    SizedBox(
                      child: Wrap(
                        children: [
                          if(widget.cocktail.strIngredient1 != null)
                            Text(
                              '${widget.cocktail.strIngredient1}',
                              style: const TextStyle(
                                  color: AppTheme.notificationText
                              ),
                            ),
                          if(widget.cocktail.strIngredient2 != null)
                            Text(
                              ', ${widget.cocktail.strIngredient2}',
                              style: const TextStyle(
                                  color: AppTheme.notificationText
                              ),
                            ),
                          if(widget.cocktail.strIngredient3 != null)
                            Text(
                              ', ${widget.cocktail.strIngredient3}',
                              style: const TextStyle(
                                  color: AppTheme.notificationText
                              ),
                            ),
                          if(widget.cocktail.strIngredient4 != null)
                            Text(
                              ', ${widget.cocktail.strIngredient4}',
                              style: const TextStyle(
                                  color: AppTheme.notificationText
                              ),
                            ),
                          if(widget.cocktail.strIngredient5 != null)
                            Text(
                              ', ${widget.cocktail.strIngredient5}',
                              style: const TextStyle(
                                  color: AppTheme.notificationText
                              ),
                            ),
                          if(widget.cocktail.strIngredient6 != null)
                            Text(
                              ', ${widget.cocktail.strIngredient6}',
                              style: const TextStyle(
                                  color: AppTheme.notificationText
                              ),
                            ),
                          if(widget.cocktail.strIngredient7 != null)
                            Text(
                              ', ${widget.cocktail.strIngredient7}',
                              style: const TextStyle(
                                  color: AppTheme.notificationText
                              ),
                            ),
                          if(widget.cocktail.strIngredient8 != null)
                            Text(
                              ', ${widget.cocktail.strIngredient8}',
                              style: const TextStyle(
                                  color: AppTheme.notificationText
                              ),
                            ),
                          if(widget.cocktail.strIngredient9 != null)
                            Text(
                              ', ${widget.cocktail.strIngredient9}',
                              style: const TextStyle(
                                  color: AppTheme.notificationText
                              ),
                            ),
                          if(widget.cocktail.strIngredient10 != null)
                            Text(
                              ', ${widget.cocktail.strIngredient10}',
                              style: const TextStyle(
                                  color: AppTheme.notificationText
                              ),
                            ),
                          if(widget.cocktail.strIngredient11 != null)
                            Text(
                              ', ${widget.cocktail.strIngredient11}',
                              style: const TextStyle(
                                  color: AppTheme.notificationText
                              ),
                            ),
                          if(widget.cocktail.strIngredient12 != null)
                            Text(
                              ', ${widget.cocktail.strIngredient12}',
                              style: const TextStyle(
                                  color: AppTheme.notificationText
                              ),
                            ),
                          if(widget.cocktail.strIngredient13 != null)
                            Text(
                              ', ${widget.cocktail.strIngredient13}',
                              style: const TextStyle(
                                  color: AppTheme.notificationText
                              ),
                            ),
                          if(widget.cocktail.strIngredient14 != null)
                            Text(
                              ', ${widget.cocktail.strIngredient14}',
                              style: const TextStyle(
                                  color: AppTheme.notificationText
                              ),
                            ),
                          if(widget.cocktail.strIngredient15 != null)
                            Text(
                              ', ${widget.cocktail.strIngredient15}',
                              style: const TextStyle(
                                  color: AppTheme.notificationText
                              ),
                            ),
                        ],
                      ),
                    ),
                    AppSpacer.H16,
                    const Text(
                      'Ingredients',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    AppSpacer.H10,
                    Text(
                      widget.cocktail.strInstructions!,
                      style: const TextStyle(
                        color: AppTheme.notificationText
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacer.H16
            ],
          ),
        ),
      ),
    );
  }
}
