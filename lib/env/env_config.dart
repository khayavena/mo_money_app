class EnvConfig {
  static const String _defaultUrl = 'https://jsonplaceholder.typicode.com';
  static const baseUrl =
      String.fromEnvironment('BASE_URL', defaultValue: _defaultUrl);
  static const apiKey = String.fromEnvironment('API_KEY', defaultValue: '');
}
