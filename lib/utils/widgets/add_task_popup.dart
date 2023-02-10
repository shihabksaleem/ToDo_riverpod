//
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/model/todo_model.dart';
import 'package:todo_riverpod/utils/constants.dart';
import 'package:todo_riverpod/view_model/providers/todo_notifier.dart';

Future<dynamic> AddNewTaskPopup(BuildContext context, WidgetRef ref) {
  final TextEditingController newtaskController = TextEditingController();
  final todoList = ref.watch(todoProvider);
  int id = todoList.length;

  String category = Professional;

  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: Theme.of(context).cardColor,
      title: Center(
        child: Text('Create new task'),
      ),
      actions: [
        TextField(
          controller: newtaskController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Enter new task',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                category = Professional;
              },
              child: Icon(
                Icons.work,
                size: 30,
                color: category == Professional ? Colors.blue : Colors.white,
              ),
            ),
            SizedBox(width: 25),
            GestureDetector(
              onTap: () {
                category = Personal;
              },
              child: Icon(
                Icons.person,
                size: 30,
                color: category == Personal ? Colors.blue : Colors.white,
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .35,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xff3450a1))),
              onPressed: () {
                //Add new task to the list
                if (newtaskController.text.trim().isEmpty) {
                  return Navigator.pop(context);
                } else {
                  // to increment the id

                  ref.read(todoProvider.notifier).addTask(TodoMOdel(
                      index: id,
                      category: category,
                      taskName: newtaskController.text));
                  Navigator.pop(context);
                  print(id.toString());
                }
              },
              child: Text(
                'Add',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
