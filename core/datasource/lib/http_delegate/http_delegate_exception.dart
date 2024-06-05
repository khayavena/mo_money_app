import 'package:dio/dio.dart';

class HttpDelegateException extends Error {
  late String message;

  HttpDelegateException(DioException error) {
    _process(error);
  }

  void _process(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout try again';
        break;
      case DioExceptionType.sendTimeout:
        message = 'Timeout could not send request';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Timeout could not receive data';
        break;
      case DioExceptionType.badResponse:
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
      case DioExceptionType.cancel:
        message = 'Canceled Request';
        break;
      case DioExceptionType.unknown:
        message = 'Something went wrong';
        break;
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        break;
      case DioExceptionType.connectionError:
        // TODO: Handle this case.
        break;
    }
  }
}
