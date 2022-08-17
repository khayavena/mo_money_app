class HttpDelegateGeneralException extends Error {
  final Error error;

  HttpDelegateGeneralException(this.error);
}
