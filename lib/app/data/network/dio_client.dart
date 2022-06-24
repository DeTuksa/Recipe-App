import 'dart:io';
import 'package:daisy_recipe/app/data/models/token_model.dart';
import 'package:daisy_recipe/app/data/storage/cached_data.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

Dio client() {

  var logger = Logger();
  CachedData _cachedData = CachedData();

  Dio dio = Dio();
  dio.options.baseUrl = 'https://tuksa-recipe-app.herokuapp.com/';
  dio.options.connectTimeout = 30000;
  dio.interceptors.add(InterceptorsWrapper(
      onRequest:(options, handler) async {
        // Do something before request is sent
        options.headers["Accept"] = "application/json";
        options.headers["Content-Type"] = "application/json";
        options.headers["Content-Type"] = "application/json";
        options.headers["Content-Type"] = "application/json";

        AccessTokenResponse? accessTokenResponse = await _cachedData.getAuthTokenResponse();
        String? _token = accessTokenResponse?.token;

        if (_token != null && _token.isNotEmpty) {
          options.headers["Authorization"] = "Bearer $_token";
        }
        return handler.next(options); //continue
        // If you want to resolve the request with some custom data，
        // you can resolve a `Response` object eg: `handler.resolve(response)`.
        // If you want to reject the request with a error message,
        // you can reject a `DioError` object eg: `handler.reject(dioError)`
      },
      onResponse:(response, handler) {
        // Do something with response data
        logger.d(response.data);
        return handler.next(response); // continue
        // If you want to reject the request with a error message,
        // you can reject a `DioError` object eg: `handler.reject(dioError)`
      },
      onError: (DioError e, handler) {
        // Do something with response error
        logger.d(e.response?.data);
        logger.d(e.message);
        return  handler.next(e);//continue
        // If you want to resolve the request with some custom data，
        // you can resolve a `Response` object eg: `handler.resolve(response)`.
      }
  ));

  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient dioClient) {
    dioClient.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    return dioClient;
  };

  return dio;
}