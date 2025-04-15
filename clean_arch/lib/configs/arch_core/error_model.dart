// Example custom error hierarchy
abstract class AppError {
  final String message;
  AppError(this.message);
}

class NetworkError extends AppError {
  NetworkError() : super('Network unavailable');
}

class CustomError extends AppError {
  CustomError(super.message);
}