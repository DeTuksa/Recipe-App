import 'package:daisy_recipe/app/data/models/cocktail_model.dart';
import 'package:daisy_recipe/app/data/models/recipe_model.dart';
import 'package:daisy_recipe/app/data/models/recipe_search_model.dart';
import 'package:daisy_recipe/app/data/services/cocktail_service.dart';
import 'package:daisy_recipe/app/data/services/recipe_service.dart';
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
  var recipeList = <Recipe>[].obs;
  RecipeResponse? recipeResponse;
  Cocktail? cocktail;
  String searchQuery = '';

  final count = 0.obs;
  List<Widget> body = <Widget>[
    const HomeTabView(),
    /*const SavedTabView(),
    const NotificationTabView(),*/
    const ProfileTabView()
  ];
  var bodyIndex = 0.obs;

  var loadingCocktails = false.obs;
  var loadingRecipes = false.obs;

  List<SearchItem> searchResults = [];
  var searchLoading = false.obs;

  @override
  void onInit() {
    Get.put(NotificationController());
    fetchRandomCocktails();
    fetchRandomRecipes();
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

  addSearchQuery(String query) {
    searchQuery = query;
    print(searchQuery);
    // update();
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

  Future<List<Drink>> getMoreCocktails() async {
    // loadingCocktails.value = true;
    List<Drink> drinks = [];

    try {
      final response = await CocktailService().getRandomCocktails();
      drinks = Cocktail.fromJson(response.data).drinks;
      // cocktailList.value = cocktail!.drinks;
      update();
      // loadingCocktails.value = false;
    } on DioError catch (e) {
      // loadingCocktails.value = false;
    }
    return drinks;
  }

  fetchRandomRecipes() async {
    loadingRecipes.value = true;
    try {
      final response = await RecipeService().getRandomRecipes();
      recipeResponse = RecipeResponse.fromJson(response.data);
      recipeList.value = recipeResponse!.recipes;
      update();
      loadingRecipes.value = false;
    } on DioError catch (e) {
      loadingRecipes.value = false;
    }
  }

  Future<List<Recipe>> moreRandomRecipes() async {
    // loadingRecipes.value = true;
    List<Recipe> recipes = [];
    try {
      final response = await RecipeService().getRandomRecipes();
      recipes = RecipeResponse.fromJson(response.data).recipes;
      update();
      // loadingRecipes.value = false;
    } on DioError catch (e) {
      // loadingRecipes.value = false;
    }
    return recipes;
  }

  searchRecipe({required String query}) async {
    searchLoading.value = true;
    // List<Recipe> recipes = [];
    try {
      final response = await RecipeService().searchRecipe(query: query);
      searchResults = SearchResponse.fromJson(response.data).searchItems;
      update();
      searchLoading.value = false;
    } on DioError catch (e) {
      searchLoading.value = false;
    }
  }
}
