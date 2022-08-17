import 'package:dio/dio.dart';

class HttpDelegateException extends Error {
  late String message;

  HttpDelegateException(DioError error) {
    _process(error);
  }

  void _process(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        message = 'Connection timeout try again';
        break;
      case DioErrorType.sendTimeout:
        message = 'Timeout could not send request';
        break;
      case DioErrorType.receiveTimeout:
        message = 'Timeout could not receive data';
        break;
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case 500:
            message = 'Internal Server Error';
            break;
          case 404:
            message = 'Results Not Found';
            break;
          case 401:
            message = 'Unauthorised to access';
            break;
        }
        break;
      case DioErrorType.cancel:
        message = 'Canceled Request';
        break;
      case DioErrorType.other:
        message = 'Something went wrong';
        break;
    }
  }
}
