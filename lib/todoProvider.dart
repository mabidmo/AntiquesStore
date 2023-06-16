import 'package:flutter/cupertino.dart';

class todoProvider with ChangeNotifier {
  List<String> todos = [];
  List<String> get getTodos => todos;
  void addTodo(String todo) {
    todos.add(todo);
  }
}
