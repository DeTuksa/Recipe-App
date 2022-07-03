import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHelper {

  Widget showCocktailShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.2),
      highlightColor: Colors.grey.withOpacity(0.5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
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
                          borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.withOpacity(0.6),
                      ),
                      width: 125, height: 125,
                    ),
                    AppSpacer.H10,
                    Container(
                      height: 20,
                      width: 125,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(2)
                      ),
                    )
                  ],
                ),
              ),
              AppSpacer.W10
            ],
          );
        },
      ),
    );
  }

  Widget showPopularShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.2),
      highlightColor: Colors.grey.withOpacity(0.5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Row(
            children: [
              AppSpacer.W10,
              SizedBox(
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
                          color: Colors.grey.withOpacity(0.6),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                    color: Colors.grey.withOpacity(0.6),
                                  ),
                                  height: 24, width: 24,
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
                            border: Border.all(color: Colors.grey.withOpacity(0.6), width: 4),
                          color: Colors.grey.withOpacity(0.6),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              AppSpacer.W10
            ],
          );
        },
      ),
    );
  }

  Widget showTrendingShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.2),
      highlightColor: Colors.grey.withOpacity(0.5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Row(
            children: [
              AppSpacer.W10,
              Column(
                children: [
                  Container(
                    height: 165, width: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.6),
                    ),
                  ),
                  AppSpacer.H10,
                  Container(
                    width: 280,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(2)
                    ),
                  )
                ],
              ),
              AppSpacer.W10
            ],
          );
        },
      ),
    );
  }
}