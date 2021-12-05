import 'package:dependency_management/models/model_todo.dart';
import 'package:dependency_management/repositories/repository_todo.dart';
import 'package:flutter_test/flutter_test.dart';
import '../http_mock.dart';

void main() {
  test('get todo list', () async {
    final httpClient = HttpMock(
      getResponse: [
        {'id': 1, 'title': 'teste todo', 'userId': 1, 'completed': false}
      ],
    );

    final repository = RepositoryTodo(httpClient: httpClient);

    final list = await repository.getAllTodos();
    final result = list is List<ModelTodo>;
    expect(result, true);
    expect(list.length, 1);
  });
}
