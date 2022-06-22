import 'dart:convert';

import 'package:daisy_recipe/app/data/network/dio_client.dart';
import 'package:dio/dio.dart';

class AuthenticationService {
  Dio apiClient = client();

  Future<Response> login({required String username, required String password}) async {
    var postBody = jsonEncode({
      'username': username,
      'password': password
    });

    final response = await apiClient.post('/user/login', data: postBody);
    return response;
  }
}