import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/data/models/cocktail_model.dart';
import 'package:flutter/material.dart';

class RecentCard extends StatefulWidget {
  final Drink drink;
  const RecentCard({Key? key, required this.drink}) : super(key: key);

  @override
  State<RecentCard> createState() => _RecentCardState();
}

class _RecentCardState extends State<RecentCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppSpacer.W10,
        SizedBox(
          width: 125,
          height: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
                ),
                width: 125, height: 125,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.drink.strDrinkThumb!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              AppSpacer.H10,
              Text(
                widget.drink.strDrink,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              )
            ],
          ),
        ),
        AppSpacer.W10
      ],
    );
  }
}
