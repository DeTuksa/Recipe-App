import 'package:daisy_recipe/app/data/network/dio_client.dart';
import 'package:dio/dio.dart';

class RecipeService {
  Dio apiClient = client();

  Future<Response> getRandomRecipes() async {
    final response = await apiClient.get('/recipes/get-recipe');
    return response;
  }

  Future<Response> searchRecipe({required String query}) async {
    var queryString = {
      "query": query
    };
    final response = await apiClient.get('/recipes/search-recipe', queryParameters: queryString);
    return response;
  }

  Future<Response> searchRecipeById({required int id}) async {
    var queryString = {
      "recipe_id": id
    };
    final response = await apiClient.get('/recipes/get-recipe-by-id', queryParameters: queryString);
    return response;
  }
}