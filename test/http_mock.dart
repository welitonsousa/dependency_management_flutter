import 'package:dependency_management/services/http_interface.dart';

class HttpMock extends HttpClient {
  dynamic getResponse, deleteResponse, putResponse, postResponse;

  HttpMock({
    this.getResponse,
    this.deleteResponse,
    this.postResponse,
    this.putResponse,
  });

  @override
  Future get(String url) async {
    return this.getResponse;
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
  void setToken(String token) {}
}
