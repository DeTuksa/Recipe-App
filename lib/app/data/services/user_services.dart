import 'dart:convert';

import 'package:daisy_recipe/app/data/network/dio_client.dart';
import 'package:dio/dio.dart';

class UserService {
  Dio apiClient = client();

  Future<Response> updatePushNotificationId({required String registrationToken}) async {
    var postBody = jsonEncode({
      'push_notification_id': registrationToken
    });
    final response = await apiClient.patch('/user/update', data: postBody);
    return response;
  }
}