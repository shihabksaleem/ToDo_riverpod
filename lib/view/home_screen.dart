import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/utils/widgets/add_task_popup.dart';

import 'package:todo_riverpod/utils/widgets/category_card.dart';
import 'package:todo_riverpod/utils/widgets/custom_drawer.dart';
import 'package:todo_riverpod/utils/widgets/task_checkbox_container.dart';
import 'package:todo_riverpod/view_model/providers/todo_notifier.dart';

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
          onPressed: () => AddNewTaskPopup(context, ref),
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
        body: SafeArea(
          child: Container(
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
                  flex: 2,
                  child: todoList.isNotEmpty
                      ? Align(
                          alignment: Alignment.topCenter,
                          child: ListView.separated(
                              shrinkWrap: true,
                              reverse: true,
                              padding: EdgeInsets.all(20),
                              itemBuilder: (context, index) =>
                                  TaskCheckboxContainer(index: index),
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 10,
                                  ),
                              itemCount: todoList.length),
                        )
                      : Center(child: Text('Add New Tasks'))),
            ]),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    _advancedDrawerController.value = AdvancedDrawerValue.visible();
    // _advancedDrawerController.showDrawer();
  }
}
