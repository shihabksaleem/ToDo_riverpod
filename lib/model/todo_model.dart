class TodoMOdel {
  final int index;
  final String category;
  final String taskName;
  final bool isCompleted;

  TodoMOdel({
    required this.index,
    this.isCompleted = false,
    required this.category,
    required this.taskName,
  });

  TodoMOdel copyWith({
    int? index,
    bool? isCompleted,
    String? category,
    String? taskName,
  }) {
    return TodoMOdel(
      index: index ?? this.index,
      category: category ?? this.category,
      taskName: taskName ?? this.taskName,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
