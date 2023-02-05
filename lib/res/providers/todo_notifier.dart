import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/res/model%20class/todo_model.dart';

class TodoNotifier extends StateNotifier<List<TodoMOdel>> {
  TodoNotifier() : super([]);

  addTask(TodoMOdel todo) {
    state = [...state, todo];
  }

  void deleteTask(TodoMOdel todo) {
    state = state.where((_todo) => _todo != todo).toList();
  }
}
