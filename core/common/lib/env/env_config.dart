import 'dart:developer';
import 'dart:ffi';

class EnvConfig {
  static const String defaultUrl =
      'https://eu-central-1.aws.data.mongodb-api.com/app/application-0-xjvsy/endpoint';

  static getBaseUrl() {
    const baseUrl = String.fromEnvironment('BASE_URL', defaultValue: "");
    log(baseUrl);
    return baseUrl;
  }

  static const apiKey = String.fromEnvironment('API_KEY', defaultValue: '');
  static const live = bool.fromEnvironment('LIVE', defaultValue: true);
}
