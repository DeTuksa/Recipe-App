import 'dart:convert';
import 'package:daisy_recipe/app/data/models/token_model.dart';
import 'package:daisy_recipe/app/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CachedData{

  Future<AccessTokenResponse?> getAuthTokenResponse() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String? data =  sharedPreferences.getString('CACHE_TOKEN');
    if (data != null) {
      return AccessTokenResponse.fromJson(jsonDecode(data));
    }  else {
      return null;
    }
  }

  Future<void> cacheAuthTokenResponse({required AccessTokenResponse accessTokenResponse}) async {
    print("saving ${accessTokenResponse.toJson()}");
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('CACHE_TOKEN', jsonEncode(accessTokenResponse.toJson()));
  }

  Future<void> cacheUserDetails({required User user}) async {
    print("saving ${user.toJson()}");
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('USER_DETAILS', jsonEncode(user.toJson()));
  }

  Future<User?> getUserDetails() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String? userData = sharedPreferences.getString('USER_DETAILS');
    if (userData != null) {
      return User.fromJson(jsonDecode(userData));
    } else {
      return null;
    }
  }
}
