import 'package:daisy_recipe/app/data/constants/app_theme.dart';
import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/data/models/recipe_model.dart';
import 'package:flutter/material.dart';

class IngredientWidget extends StatefulWidget {

  final ExtendedIngredient ingredients;

  const IngredientWidget({Key? key, required this.ingredients}) : super(key: key);

  @override
  State<IngredientWidget> createState() => _IngredientWidgetState();
}

class _IngredientWidgetState extends State<IngredientWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppTheme.notificationBackground
          ),
          padding: const EdgeInsets.symmetric(
              vertical: 32, horizontal: 20
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /*Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white
                    ),
                    height: 52, width: 52,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        widget.ingredients.image!
                      ),
                    ),
                  ),
                  AppSpacer.W20,*/
                  SizedBox(
                    width: 200,
                    child: Text(
                      '${widget.ingredients.name ?? widget.ingredients.originalName}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  )
                ],
              ),
              Text(
                '${widget.ingredients.measures!.metric!.amount}${widget.ingredients.measures!.metric!.unitShort}',
                style: const TextStyle(
                  color: AppTheme.notificationText,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        AppSpacer.H16
      ],
    );
  }
}
