import 'package:flutter/material.dart';
import 'package:ndhulite/pages/to_do_menu/header_view.dart';
import 'package:ndhulite/pages/to_do_menu/task_info_view.dart';
import 'package:ndhulite/pages/to_do_menu/task_list_view.dart';
import 'package:ndhulite/pages/to_do_menu/task_setup.dart';
import 'package:ndhulite/pages/to_do_menu/adding_task_menu.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(flex: 1, child: HeaderView()),
              Expanded(flex: 1, child: TaskInfoView()),
              Expanded(flex: 7, child: TaskListView()),
            ],
          ),
        ),
        floatingActionButton: const AddTaskMenu());
  }
}
