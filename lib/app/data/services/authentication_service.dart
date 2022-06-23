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

  Future<Response> createUser({
    required String name,
    required String username,
    required String email,
    required String password
  }) async {
    var postBody = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password
    });

    final response = await apiClient.post('/user', data: postBody);
    return response;
  }
}