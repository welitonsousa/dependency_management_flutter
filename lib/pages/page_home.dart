import 'package:dependency_management/controllers/controller_todo.dart';
import 'package:dependency_management/models/model_todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  final controller = Modular.get<ControllerTodo>();

  @override
  void initState() {
    this.controller.getAllTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: this.appBar,
      body: AnimatedBuilder(
        animation: this.controller,
        builder: (_, __) => this.body,
      ),
    );
  }

  PreferredSizeWidget get appBar {
    return AppBar(
      title: Text('todo list'),
    );
  }

  Widget get body {
    if (this.controller.state == ModelState.loading)
      return Center(child: CircularProgressIndicator());

    return ListView.builder(
      itemCount: this.controller.list.length,
      itemBuilder: (context, index) => this.itemList(
        this.controller.list[index],
      ),
    );
  }

  Widget itemList(ModelTodo todo) {
    return ListTile(
      title: Text(todo.title),
      leading: Checkbox(value: todo.completed, onChanged: (value) {}),
    );
  }
}
