import 'package:daisy_recipe/app/data/helpers/ad_helper.dart';
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
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var cocktailList = <Drink>[].obs;
  var recipeList = <Recipe>[].obs;
  RecipeResponse? recipeResponse;
  Cocktail? cocktail;
  String searchQuery = '';
  BannerAd? bannerAd;
  BannerAd? bannerAdRecipeDetails;

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
  var searchDetailsLoading = false.obs;
  SearchByIdResponse? searchById;

  AppOpenAd? appOpenAd;
  bool isShowingOpenAd = false;

  @override
  void onInit() {
    getBannerAd();
    getRecipeBannerAd();
    // loadOpenAd();
    listenToAppStateChanges();
    fetchRandomCocktails();
    fetchRandomRecipes();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
   bannerAd?.dispose();
   bannerAdRecipeDetails?.dispose();
   super.onClose();
  }
  void increment() => count.value++;

  bool isBannerLoaded = false;
  bool isRecipeBannerLoaded = false;

  //
  void getBannerAd() {
    bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isBannerLoaded = true;
          update();
        },
        onAdFailedToLoad: (ad, error) {
          // Releases an ad resource when it fails to load
          ad.dispose();

          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    );

    // TODO: Load an ad
    bannerAd?.load();

    update();
  }

  void getRecipeBannerAd() {
    bannerAdRecipeDetails = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isRecipeBannerLoaded = true;
          update();
        },
        onAdFailedToLoad: (ad, error) {
          // Releases an ad resource when it fails to load
          ad.dispose();

          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    );

    // TODO: Load an ad
    bannerAdRecipeDetails?.load();
    // update();
  }

  void loadOpenAd() {
    AppOpenAd.load(
      adUnitId: AdHelper.appOpenAdUnitId,
      orientation: AppOpenAd.orientationPortrait,
      request: AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          appOpenAd = ad;
          update();
        },
        onAdFailedToLoad: (error) {
          print('AppOenAd failed to load: $error');
        }
      )
    );
    update();
  }

  void showAdIfAvailable() {
    if (!isOpenAdAvailable) {
      print('Tried to show ad before available.');
      loadOpenAd();
      return;
    }
    if (isShowingOpenAd) {
      print('Tried to show ad while already showing an ad.');
      return;
    }
    // Set the fullScreenContentCallback and show the ad.
    appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        isShowingOpenAd = true;
        print('$ad onAdShowedFullScreenContent');
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        isShowingOpenAd = false;
        ad.dispose();
        appOpenAd = null;
      },
      onAdDismissedFullScreenContent: (ad) {
        print('$ad onAdDismissedFullScreenContent');
        isShowingOpenAd = false;
        ad.dispose();
        appOpenAd = null;
        loadOpenAd();
      },
    );
    update();
  }

  bool get isOpenAdAvailable {
    return appOpenAd != null;
  }


  void listenToAppStateChanges() {
    print('Listening');
    AppStateEventNotifier.startListening();
    AppStateEventNotifier.appStateStream
        .forEach((state) => onAppStateChanged(state));
    update();
  }

  void onAppStateChanged(AppState appState) {
    // Try to show an app open ad if the app is being resumed and
    // we're not already showing an app open ad.
    if (appState == AppState.foreground) {
      showAdIfAvailable();
      print("Should show here");
    }
    update();
  }

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

  Future<List<Drink>> getMoreCocktails() async {
    List<Drink> drinks = [];

    try {
      final response = await CocktailService().getRandomCocktails();
      drinks = Cocktail.fromJson(response.data).drinks;
      update();
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
    List<Recipe> recipes = [];
    try {
      final response = await RecipeService().getRandomRecipes();
      recipes = RecipeResponse.fromJson(response.data).recipes;
      update();
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

  Future<Recipe> searchRecipeById({required int id}) async {
    searchDetailsLoading.value = true;
    Recipe? recipe;
    try {
      final response = await RecipeService().searchRecipeById(id: id);
      recipe = SearchByIdResponse.fromJson(response.data).recipe;
      update();
      searchDetailsLoading.value = false;
    } on DioError catch (e) {
      searchDetailsLoading.value = false;
    }
    return recipe!;
  }
}
