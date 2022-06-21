import 'package:dio/dio.dart';

class ApiError {
  int? errorType = 0;
  String? errorDescription;

  ApiError({this.errorDescription});

  ApiError.fromDio(Object dioError) {
    _handleError(dioError);
  }

  void _handleError(Object error) {
    if (error is DioError) {
      DioError dioError = error; // as DioError;
      switch (dioError.type) {
        case DioErrorType.connectTimeout:
          errorDescription = "Connection failed\nplease check your internet connection";
          break;
        case DioErrorType.sendTimeout:
          errorDescription = "Connection timeout";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = "Timeout error";
          break;
        case DioErrorType.response:
          errorType = dioError.response!.statusCode!;
          errorDescription = extractDescriptionFromResponse(dioError.response!);
          break;
        case DioErrorType.cancel:
          errorDescription = "Request cancelled";
          break;
        case DioErrorType.other:
          errorDescription = "Oops! error occurred,\nplease check your internet connection and try again";
          break;
      }
    } else {
      errorDescription = "Unknown error occurred, please try again";
    }
  }

  String extractDescriptionFromResponse(Response response) {
    String message = "";
    try {
      if (response.data != null && response.data["message"] != null) {
        message = response.data["message"];
      }else {
        message = response.statusMessage!;
      }
    } catch (error) {
      message = response.statusMessage ?? error.toString();
    }
    return message;
  }

  @override
  String toString() => '$errorDescription';
}