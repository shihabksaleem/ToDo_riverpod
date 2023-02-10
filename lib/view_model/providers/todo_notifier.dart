import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/model/todo_model.dart';

class TodoNotifier extends StateNotifier<List<TodoMOdel>> {
  TodoNotifier() : super([]);

  addTask(TodoMOdel todo) {
    state = [...state, todo];
  }

  void deleteTask({required TodoMOdel todo, required int id}) {
    state = state.where((_todo) => _todo != todo).toList();
    state = [
      for (final todo in state)
        if (todo.index > id) todo.copyWith(index: todo.index - 1) else todo
    ];
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

final todoProvider =
    StateNotifierProvider<TodoNotifier, List<TodoMOdel>>((ref) {
  return TodoNotifier();
});
