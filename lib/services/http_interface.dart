abstract class HttpClient {
  Future<dynamic> get(String url);
  Future<dynamic> delete(String url);
  Future<dynamic> post(String url, {required Map<String, dynamic> data});
  Future<dynamic> put(String url, {required Map<String, dynamic> data});

  void setToken (String token);
}
