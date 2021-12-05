class ModelTodo {
  final int user;
  final int id;
  final String title;
  final bool completed;

  ModelTodo({required this.title, required this.completed, required this.id, required this.user});

  factory ModelTodo.toJson ({required Map json}) {
    return ModelTodo(
      completed: json['completed'],
      id: json['id'],
      title: json['title'],
      user: json['userId']
    );
  }
}