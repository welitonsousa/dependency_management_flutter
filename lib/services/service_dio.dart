import 'package:dependency_management/env.dart';
import 'package:dio/dio.dart';
import 'http_interface.dart';

class DioClient extends HttpClient {
  Dio _dio = Dio(BaseOptions(baseUrl: Env.BASE_URL));

  @override
  void setToken(String token) {
    this._dio.options.headers = {"Authorization": "Bearer $token"};
  }

  @override
  Future<dynamic> get(String url) async {
    final response = await this._dio.get(url);
    return response.data;
  }

  @override
  Future<dynamic> delete(String url) async {
    final response = await this._dio.delete(url);
    return response.data;
  }

  @override
  Future<dynamic> post(String url, {required Map<String, dynamic> data}) async {
    throw UnimplementedError();
  }

  @override
  Future<dynamic> put(String url, {required Map<String, dynamic> data}) async {
    throw UnimplementedError();
  }
}
