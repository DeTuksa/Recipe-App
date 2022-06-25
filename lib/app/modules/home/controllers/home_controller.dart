import 'package:daisy_recipe/app/data/models/cocktail_model.dart';
import 'package:daisy_recipe/app/data/services/cocktail_service.dart';
import 'package:daisy_recipe/app/modules/home/views/home_tab_view.dart';
import 'package:daisy_recipe/app/modules/home/views/notification_tab_view.dart';
import 'package:daisy_recipe/app/modules/home/views/profile_tab_view.dart';
import 'package:daisy_recipe/app/modules/home/views/saved_tab_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daisy_recipe/app/notification_controller.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var cocktailList = <Drink>[].obs;
  Cocktail? cocktail;

  final count = 0.obs;
  List<Widget> body = <Widget>[
    const HomeTabView(),
    const SavedTabView(),
    const NotificationTabView(),
    const ProfileTabView()
  ];
  var bodyIndex = 0.obs;

  var loadingCocktails = false.obs;
  @override
  void onInit() {
    Get.put(NotificationController());
    fetchRandomCocktails();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  changeBodyIndex(int newIndex) {
    bodyIndex.value = newIndex;
    update();
  }

  fetchRandomCocktails() async {
    loadingCocktails.value = true;
    try {
      final response = await CocktailService().getRandomCocktails();
      cocktail = Cocktail.fromJson(response.data);
      cocktailList.value = cocktail!.drinks;
      update();
      loadingCocktails.value = false;
    } on DioError catch (e) {
      loadingCocktails.value = false;
    }
  }
}
