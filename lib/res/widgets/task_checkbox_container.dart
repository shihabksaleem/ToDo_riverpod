import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_riverpod/home_screen.dart';

class TaskCheckboxContainer extends StatelessWidget {
  final WidgetRef ref;

  final int index;

  TaskCheckboxContainer({required this.ref, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    final todoList = ref.watch(todoProvider);
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
          isChecked = !isChecked;
        },
        child: Container(
          height: 70,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xff041955),
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
                    value: isChecked,
                    checkColor: Colors.white,
                    activeColor: Color(0xff3450a1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      isChecked = !isChecked;
                    },
                  ),
                ),
              ),
              Container(
                child: Text(
                  todoList[index].taskName,
                  style: TextStyle(
                      decoration: isChecked ? TextDecoration.lineThrough : null,
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
