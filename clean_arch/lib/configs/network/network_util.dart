import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@singleton // Marks this class as a singleton for dependency injection
class NetworkUtil {
  late Dio _dio;

  // Constructor with optional parameters
  NetworkUtil(@Named("baseUrl") String baseUrl) {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl
    ));

    // Optional: Add logging interceptors for debugging
    _dio.interceptors.add(PrettyDioLogger(responseBody: true,requestBody: true));
  }

  Future<DioResponseModel> get(
      String endpoint, {
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
      }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return DioResponseModel(response: response);
    } on DioException catch (e) {
      return DioResponseModel(exception: e);
    }
  }

  Future<DioResponseModel> post(
      String endpoint, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
      }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return DioResponseModel(response: response);
    } on DioException catch (e) {
      return DioResponseModel(exception: e);
    }
  }

// Additional methods for PUT, DELETE, etc., can be added similarly
}


class DioResponseModel {
  final Response? response;
  final DioException? exception;

  DioResponseModel({
    this.response,
    this.exception,
  });
}