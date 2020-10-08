import 'package:dio/dio.dart';

/// [API]: a class that initial [Dio] object to call [get] and also pass intiial headers / url when constructor run
class API {
  // please refer yourself for more detail for the used API, https://the-one-api.dev/
  Dio _dio;
  // s9mWWP_vCTJEjRKt4sdC
  API() {
    // this bearer code may not work after publishing this repository
    _dio = new Dio(BaseOptions(
        baseUrl: 'https://the-one-api.dev/v2/',
        headers: {'Authorization': 'Bearer s9mWWP_vCTJEjRKt4sdC'}));
  }

  Future get(String path, {Map<String, dynamic> paramters}) async {
    try {
      final response = await _dio.get(path, queryParameters: paramters ?? {});

      return response.data;
    } on DioError {
      rethrow;
    }
  }
}
