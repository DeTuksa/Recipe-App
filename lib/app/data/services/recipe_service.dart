import 'package:daisy_recipe/app/data/network/dio_client.dart';
import 'package:dio/dio.dart';

class RecipeService {
  Dio apiClient = client();

  Future<Response> getRandomRecipes() async {
    final response = await apiClient.get('/recipes/get-recipe');
    return response;
  }
}