import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/model/todo_model.dart';

class TodoNotifier extends StateNotifier<List<TodoMOdel>> {
  TodoNotifier() : super([]);

  addTask(TodoMOdel todo) {
    state = [...state, todo];
  }

  void deleteTask(TodoMOdel todo) {
    state = state.where((_todo) => _todo != todo).toList();
  }

  void toggle(int id) {
    state = [
      for (final todo in state)
        if (todo.index == id)
          todo.copyWith(isCompleted: !todo.isCompleted)
        else
          todo
    ];
  }
}
