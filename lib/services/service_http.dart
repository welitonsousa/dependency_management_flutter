import 'dart:convert';

import 'package:dependency_management/env.dart';
import 'package:dependency_management/services/http_interface.dart';
import 'package:http/http.dart' as _http;

class MyHttpClient extends HttpClient {
  String _token = "";

  @override
  Future get(String url) async {
    final uri = Uri.parse(Env.BASE_URL + url);
    final response = await _http.get(uri, headers: this._headers);
    return jsonDecode(response.body);
  }

  @override
  Future post(String url, {required Map<String, dynamic> data}) {
    throw UnimplementedError();
  }

  @override
  Future put(String url, {required Map<String, dynamic> data}) {
    throw UnimplementedError();
  }

  @override
  Future delete(String url) {
    throw UnimplementedError();
  }

  @override
  void setToken(String token) {
    this._token = token;
  }

  Map<String, String> get _headers {
    return {
      "Authorization": "Bearer ${this._token}",
    };
  }
}
