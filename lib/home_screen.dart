import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/res/model%20class/todo_model.dart';
import 'package:todo_riverpod/res/providers/todo_notifier.dart';

import 'package:todo_riverpod/res/widgets/category_card.dart';
import 'package:todo_riverpod/res/widgets/custom_drawer.dart';
import 'package:todo_riverpod/res/widgets/task_checkbox_container.dart';

final todoProvider =
    StateNotifierProvider<TodoNotifier, List<TodoMOdel>>((ref) {
  return TodoNotifier();
});

class HomeScreen extends ConsumerWidget {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoProvider);
    return AdvancedDrawer(
      backdropColor: Theme.of(context).drawerTheme.backgroundColor,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 400),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      drawer: CustomAppBar(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => AddTaskPopup(context, ref),
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 30,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none_outlined,
                  size: 30,
                )),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Whats up, Shihab!',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 20),
                  const Text('Categories'),
                ],
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    CategoryCard(
                        progressColor: Color(0xffeb06ff),
                        Title: 'Professional',
                        numberOfTasks: 40),
                    SizedBox(width: 15),
                    CategoryCard(
                        progressColor: Color(0xff0568fd),
                        Title: 'Personal',
                        numberOfTasks: 18),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text('Todays Tasks'),
            ),
            SizedBox(height: 20),
            Expanded(
                child: todoList.isNotEmpty
                    ? ListView.separated(
                        padding: EdgeInsets.all(20),
                        itemBuilder: (context, index) => TaskCheckboxContainer(
                              ref: ref,
                              index: index,
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                        itemCount: todoList.length)
                    : Center(child: Text('Add New Tasks')))
          ]),
        ),
      ),
    );
  }

//
  Future<dynamic> AddTaskPopup(BuildContext context, WidgetRef ref) {
    final TextEditingController newtaskController = TextEditingController();
    final todoList = ref.watch(todoProvider);
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Color(0xff041955),
        title: Center(child: Text('Create new task')),
        actions: [
          TextField(
            controller: newtaskController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: 'Enter new task',
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none),
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
                    if (newtaskController.text == null ||
                        newtaskController.text.isEmpty) {
                      return Navigator.pop(context);
                    } else {
                      ref.read(todoProvider.notifier).addTask(TodoMOdel(
                          category: 'Professional',
                          taskName: newtaskController.text));
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Add',
                    style: Theme.of(context).textTheme.labelLarge,
                  )),
            ),
          )
        ],
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    _advancedDrawerController.value = AdvancedDrawerValue.visible();
    // _advancedDrawerController.showDrawer();
  }
}
