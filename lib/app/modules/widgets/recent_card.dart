import 'package:daisy_recipe/app/data/constants/asset_paths.dart';
import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:flutter/material.dart';

class RecentCard extends StatefulWidget {
  const RecentCard({Key? key}) : super(key: key);

  @override
  State<RecentCard> createState() => _RecentCardState();
}

class _RecentCardState extends State<RecentCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 125,
          height: 190,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
                ),
                width: 125, height: 125,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    AssetPath.recentDummy,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              AppSpacer.H10,
              const Text(
                'Indonesian chicken burger',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              )
            ],
          ),
        ),
        AppSpacer.W16
      ],
    );
  }
}
