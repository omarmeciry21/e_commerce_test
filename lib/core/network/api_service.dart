import 'package:dio/dio.dart';
import 'package:e_commerce_test/core/secure_storage_configurations.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final String baseUrl;
  late final Dio _dio;

  ApiService({required this.baseUrl}) {
    _dio = kDebugMode
        ? (Dio()
          ..interceptors.add(
            PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseBody: true,
              responseHeader: false,
              compact: false,
            ),
          ))
        : Dio();
  }
  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Object? data,
    bool includeAuthToken = true,
    Duration? duration,
  }) async {
    final authToken = await SecureStorageConfigurations.getUserToken();
    debugPrint("GET: $baseUrl$endPoint\n$authToken");
    Response response = await _dio.get(
      "$baseUrl$endPoint",
      queryParameters: queryParameters,
      data: data,
      options: Options(
        headers: headers ??
            {
              'Content-Type': 'application/json',
              if (includeAuthToken && authToken != null)
                'Authorization': 'Bearer $authToken',
            },
      ),
    ); //.timeout(duration ?? Duration(seconds: 5));
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
    Map<String, dynamic>? headers,
    bool includeAuthToken = true,
    Duration? duration,
    bool isFullURL = false,
  }) async {
    final authToken = await SecureStorageConfigurations.getUserToken();
    var response = await _dio.post(
      isFullURL ? endPoint : "$baseUrl$endPoint",
      data: data,
      options: Options(
        headers: headers ??
            {
              'Content-Type': 'application/json',
              if (includeAuthToken && authToken != null)
                'Authorization': 'Bearer $authToken',
            },
      ),
    ); //.timeout(duration ?? Duration(seconds: 5));
    return response.data;
  }

  Future<Map<String, dynamic>> postImage({
    required String endPoint,
    Map<String, dynamic>? headers,
    required Object? data,
    Duration? duration,
  }) async {
    var response = await _dio.post("$baseUrl$endPoint",
        data: data); //.timeout(duration ?? Duration(seconds: 5));
    return response.data;
  }

  Future<Map<String, dynamic>> delete({
    required String endPoint,
    required Map<String, dynamic> data,
    Map<String, dynamic>? headers,
    bool includeAuthToken = true,
    Duration? duration,
  }) async {
    final authToken = await SecureStorageConfigurations.getUserToken();
    var response = await _dio.delete(
      "$baseUrl$endPoint",
      queryParameters: data,
      options: Options(
        headers: headers ??
            {
              'Content-Type': 'application/json',
              if (includeAuthToken && authToken != null)
                'Authorization': 'Bearer $authToken',
            },
      ),
    ); //.timeout(duration ?? Duration(seconds: 5));
    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    required Map<String, dynamic> data,
    Map<String, dynamic>? headers,
    bool includeAuthToken = true,
    Duration? duration,
  }) async {
    final authToken = await SecureStorageConfigurations.getUserToken();
    var response = await _dio.put(
      "$baseUrl$endPoint",
      data: data,
      options: Options(
        headers: headers ??
            {
              'Content-Type': 'application/json',
              if (includeAuthToken && authToken != null)
                'Authorization': 'Bearer $authToken',
            },
      ),
    ); //.timeout(duration ?? Duration(seconds: 5));
    return response.data;
  }

  Future<Map<String, dynamic>> patch({
    required String endPoint,
    Map<String, dynamic>? headers,
    required Map<String, dynamic> data,
    bool includeAuthToken = true,
    Duration? duration,
  }) async {
    final authToken = await SecureStorageConfigurations.getUserToken();
    var response = await _dio.patch(
      "$baseUrl$endPoint",
      data: data,
      options: Options(
        headers: headers ??
            {
              'Content-Type': 'application/json',
              if (includeAuthToken && authToken != null)
                'Authorization': 'Bearer $authToken',
            },
      ),
    ); //.timeout(duration ?? Duration(seconds: 5));
    return response.data;
  }
}
