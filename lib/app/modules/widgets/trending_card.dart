import 'package:daisy_recipe/app/data/constants/asset_paths.dart';
import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrendingCard extends StatefulWidget {
  const TrendingCard({Key? key}) : super(key: key);

  @override
  State<TrendingCard> createState() => _TrendingCardState();
}

class _TrendingCardState extends State<TrendingCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: 180, width: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  SizedBox(
                    width: 280, height: 180,
                    child: ClipRect(
                      child: Image.asset(
                        AssetPath.trendingDummy,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Align(
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
                  ),
                  /*Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        width: 60, height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFF303030).withOpacity(0.3)
                        ),
                      ),
                    ),
                  ),*/
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        width: 42, height: 26,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFF303030).withOpacity(0.3)
                        ),
                        child: const Center(
                          child: Text(
                            '15:10',
                            style: TextStyle(
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
            AppSpacer.H10,
            Container(
              width: 280,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'How to make sushi at home',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  Icon(
                    Icons.more_horiz
                  )
                ],
              ),
            )
          ],
        ),
        AppSpacer.W16
      ],
    );
  }
}
