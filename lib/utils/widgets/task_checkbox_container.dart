import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_riverpod/view/home_screen.dart';

class TaskCheckboxContainer extends ConsumerWidget {
  final int index;

  TaskCheckboxContainer({required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // bool isChecked = false;
    final todoList = ref.watch(todoProvider);
    // final todoListreversed = List.from(todoList.reversed);
    return Slidable(
      closeOnScroll: true,
      endActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
          backgroundColor: Colors.white30,
          foregroundColor: Color(0xff041955),
          onPressed: (context) {
            ref.read(todoProvider.notifier).deleteTask(todoList[index]);
          },
          borderRadius: BorderRadius.circular(20),
          icon: Icons.delete,
        )
      ]),
      child: GestureDetector(
        onTap: () {
          ref.read(todoProvider.notifier).toggle(index);
          print(index);
          print(todoList[index].isCompleted);
          print(todoList[index].index);
        },
        child: Container(
          height: 70,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    side: BorderSide(
                      color: Color(0xffeb06ff),
                      width: 2,
                    ),
                    value: todoList[index].isCompleted,
                    checkColor: Colors.white,
                    activeColor: Color(0xff3450a1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      ref.read(todoProvider.notifier).toggle(index);
                      print(index);
                    },
                  ),
                ),
              ),
              Container(
                child: Text(
                  todoList[index].taskName,
                  style: TextStyle(
                      decoration: todoList[index].isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                      decorationColor: Color(0xffeb06ff),
                      decorationThickness: 3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
