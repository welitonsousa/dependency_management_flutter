import 'package:dependency_management/models/model_todo.dart';
import 'package:dependency_management/services/http_interface.dart';

class RepositoryTodo {
  final HttpClient httpClient;
  RepositoryTodo({required this.httpClient});

  Future<List<ModelTodo>> getAllTodos() async {
    List<ModelTodo> list = [];
    final response = await this.httpClient.get('/todos') as List;
    response.forEach((element) {
      list.add(ModelTodo.toJson(json: element));
    });

    return list;
  }
}
