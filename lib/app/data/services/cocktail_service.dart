import 'package:daisy_recipe/app/data/network/dio_client.dart';
import 'package:dio/dio.dart';

class CocktailService {
  Dio apiClient = client();
  
  Future<Response> getRandomCocktails() async {
    final response = await apiClient.get('/cocktails/random-cocktails');
    return response;
  }
}