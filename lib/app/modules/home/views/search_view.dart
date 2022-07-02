import 'dart:io';

import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/modules/home/controllers/home_controller.dart';
import 'package:daisy_recipe/app/modules/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchDelegate extends SearchDelegate {

  final homeController = Get.find<HomeController>();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Platform.isIOS ? Icons.arrow_back_ios :Icons.arrow_back
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text(
              'Input search item'
            ),
          )
        ],
      );
    }

    homeController.searchRecipe(query: query);

    return Obx(() => homeController.searchLoading.value ? Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: CircularProgressIndicator(),
        )
      ],
    ) : SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          AppSpacer.H16,
          ...List.generate(homeController.searchResults.length, (index) => SearchWidget(recipe: homeController.searchResults[index],))
        ],
      ),
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
    throw UnimplementedError();
  }

}