import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient._(this.dio);

  factory DioClient(String baseUrl, {Map<String, dynamic>? defaultHeaders}) {
    final d = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Accept': 'application/json', ...?defaultHeaders},
      ),
    );

    // Logging interceptor (only in debug)
    d.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    // Example: attach auth token interceptor (stub)
    d.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // add token if needed:
          // final token = AuthService.instance.token;
          // if (token != null) options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
      ),
    );

    // Global error handling can be added here as well

    return DioClient._(d);
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) => dio.get<T>(path, queryParameters: queryParameters, options: options);

  Future<Response<T>> post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) => dio.post<T>(
    path,
    data: data,
    queryParameters: queryParameters,
    options: options,
  );

  Future<Response<T>> put<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) => dio.put<T>(
    path,
    data: data,
    queryParameters: queryParameters,
    options: options,
  );

  Future<Response<T>> delete<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) => dio.delete<T>(
    path,
    data: data,
    queryParameters: queryParameters,
    options: options,
  );
}
