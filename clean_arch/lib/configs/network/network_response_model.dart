import 'package:dio/dio.dart';

import 'network_util.dart';

enum ErrorModel {
  noNetwork,
  serverError,
  unknown,
}

enum Status { successful, failure }

class NetworkResponseModel<T> {
  int httpStatusCode = 0;
  Status status = Status.failure;
  ErrorModel? error;
  T? data;
  String message = "";

  NetworkResponseModel({
    this.httpStatusCode = 0,
    this.status = Status.failure,
    this.error,
    this.data,
    this.message = "",
  });

  NetworkResponseModel.processRest(DioResponseModel? result, T Function(Map<String, dynamic>?) parser) {
    if (result == null) {
      _handleNullResult();
    } else {
      if (result.exception != null) {
        _handleException(result.exception!);
      } else if (result.response != null) {
        _handleResponse(result.response!, parser);
      } else {
        _handleUnknownError();
      }
    }
  }

  void _handleNullResult() {
    status = Status.failure;
    error = ErrorModel.unknown;
    message = "Null response received";
  }

  void _handleException(DioException exception) {
    status = Status.failure;
    message = exception.message ?? "Network request failed";

    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.connectionError:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        error = ErrorModel.noNetwork;
        break;
      default:
        if (exception.response?.statusCode != null &&
            exception.response!.statusCode! >= 500) {
          error = ErrorModel.serverError;
        } else {
          error = ErrorModel.unknown;
        }
    }
  }

  void _handleResponse(Response response, T Function(Map<String, dynamic>?) parser) {
    httpStatusCode = response.statusCode ?? 0;

    if (httpStatusCode >= 200 && httpStatusCode < 300) {
      status = Status.successful;
      try {
        if (response.data != null) {
          data = parser(response.data);
        }
      } catch (e) {
        status = Status.failure;
        error = ErrorModel.unknown;
        message = "Data parsing failed: $e";
      }
    } else {
      status = Status.failure;
      message = _getErrorMessage(response);
      error = httpStatusCode >= 500 ? ErrorModel.serverError : ErrorModel.unknown;
    }
  }

  String _getErrorMessage(Response response) {
    try {
      return response.data['message'] ??
          response.statusMessage ??
          "Request failed with status ${response.statusCode}";
    } catch (_) {
      return "Request failed with status ${response.statusCode}";
    }
  }

  void _handleUnknownError() {
    status = Status.failure;
    error = ErrorModel.unknown;
    message = "Unknown error occurred";
  }
}