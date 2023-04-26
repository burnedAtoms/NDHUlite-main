import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ndhulite/pages/to_do_menu/task_setup.dart';
import 'package:provider/provider.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, appModel, child) {
      return Container(
        decoration: BoxDecoration(
          //change the color of the list background
          color: Colors.green.shade300,
          //borderRadius: BorderRadius.vertical(top: Radius.circular(8))
        ),
        child: ListView.separated(
            padding: EdgeInsets.all(10),
            separatorBuilder: (context, index) {
              //affect the spacing between the lists
              return SizedBox(height: 8);
            },
            itemCount: appModel.numTasks,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  appModel.deleteTask(index);
                },
                background: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.red.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Icon(Icons.delete, color: Colors.red.shade700)),
                ),
                child: Container(
                  //colors of each list item
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 238, 237, 237),
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    leading: Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                      //color of the outline of the square for checkbox
                      side: const BorderSide(
                          width: 2, color: Color.fromARGB(255, 4, 103, 7)),
                      //checkbox coloring
                      checkColor: Colors.white,
                      activeColor: Color.fromARGB(255, 4, 103, 7),
                      value: appModel.getTaskState(index),
                      onChanged: (value) {
                        appModel.setTaskValue(index, value!);
                      },
                    ),
                    //settings for the text within the lists
                    title: Text(
                      appModel.getTaskTitle(index),
                      style: TextStyle(
                          decoration: appModel.getTaskState(index)
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          //decoration:
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              );
            }),
      );
    });
  }
}
