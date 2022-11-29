class AppException implements Exception {
  final message;
  final prefix;

  AppException([this.message, this.prefix]);

  String toString() {
    return "$prefix$message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error during comunication");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class UnprocessableEntityException extends AppException {
  UnprocessableEntityException([String? message])
      : super(message, "Unprocessable entity: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid input: ");
}
