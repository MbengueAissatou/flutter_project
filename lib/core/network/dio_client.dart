import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DioClient {
  final Dio dio;
  final FlutterSecureStorage secureStorage;

  DioClient(this.secureStorage)
      : dio = Dio(BaseOptions(baseUrl: 'https://api.doctorpoint.sn/api/v1')) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await secureStorage.read(key: 'access_token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            final refresh = await secureStorage.read(key: 'refresh_token');
            if (refresh != null) {
              await secureStorage.write(key: 'access_token', value: 'mock_refreshed_access_token');
              final clonedRequest = await dio.fetch(error.requestOptions);
              return handler.resolve(clonedRequest);
            }
          }
          handler.next(error);
        },
      ),
    );
  }
}
