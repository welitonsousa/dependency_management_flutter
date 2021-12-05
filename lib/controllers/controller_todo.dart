import 'package:dependency_management/models/model_state.dart';
export 'package:dependency_management/models/model_state.dart';
import 'package:dependency_management/models/model_todo.dart';
import 'package:dependency_management/repositories/repository_todo.dart';
import 'package:dependency_management/services/http_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ControllerTodo extends ChangeNotifier {
  final RepositoryTodo repository = RepositoryTodo(
    httpClient: Modular.get<HttpClient>(),
  );

  List<ModelTodo> _list = [];
  ModelState _state = ModelState.stopped;

  List<ModelTodo> get list => this._list;
  ModelState get state => this._state;

  Future<void> getAllTodos() async {
    try {
      this._state = ModelState.loading;
      notifyListeners();
      this._list = await this.repository.getAllTodos();
      this._state = ModelState.success;
    } catch (error) {
      this._state = ModelState.error;
    } finally {
      notifyListeners();
    }
  }
}
