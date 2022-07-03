import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/data/models/recipe_search_model.dart';
import 'package:daisy_recipe/app/modules/home/views/search_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchWidget extends StatefulWidget {

  final SearchItem recipe;

  const SearchWidget({Key? key, required this.recipe}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(SearchDetailsView(id: widget.recipe.id)),
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
                        tag: widget.recipe.id,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            widget.recipe.image,
                            fit: BoxFit.fill,
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacer.H5,
              SizedBox(
                width: Get.width,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width * 0.6,
                      child: Text(
                        widget.recipe.title,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
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
