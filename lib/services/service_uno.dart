import 'package:dependency_management/env.dart';
import 'package:uno/uno.dart';
import 'http_interface.dart';

class UnoClient extends HttpClient {
  Uno _uno = Uno(baseURL: Env.BASE_URL);

  @override
  void setToken(String token) {
    final headers = this._uno.headers;
    this._uno = Uno(
      baseURL: Env.BASE_URL,
      headers: {"Authorization": "Bearer $token", ...headers},
    );
  }

  @override
  Future<dynamic> get(String url) async {
    final response = await this._uno.get(url);
    return response.data;
  }

  @override
  Future<dynamic> delete(String url) async {
    final response = await this._uno.delete(url);
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
