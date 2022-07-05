import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/data/models/cocktail_model.dart';
import 'package:daisy_recipe/app/modules/widgets/cocktail_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCocktailsTile extends StatefulWidget {

  final Drink cocktail;
  const AllCocktailsTile({Key? key, required this.cocktail}) : super(key: key);

  @override
  State<AllCocktailsTile> createState() => _AllCocktailsTileState();
}

class _AllCocktailsTileState extends State<AllCocktailsTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.bottomSheet(CocktailBottomSheet(cocktail: widget.cocktail)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        child: SizedBox(
          width: Get.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 100, height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Hero(
                  tag: widget.cocktail.idDrink!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: widget.cocktail.strDrinkThumb == null ? SizedBox() : Image.network(
                      widget.cocktail.strDrinkThumb!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              AppSpacer.W16,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.cocktail.strDrink,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  AppSpacer.H5,
                  Text(
                    widget.cocktail.strAlcoholic ?? 'Non-Alcoholic',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  AppSpacer.H5,
                  Text(
                    widget.cocktail.strCategory ?? 'N/A',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
