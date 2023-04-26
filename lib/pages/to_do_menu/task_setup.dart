import 'package:flutter/material.dart';
//import 'dart:js';
//creating the classes necessary for storing the data
class CurrentUser {
  String username;

  CurrentUser(this.username);
}
//class for an individual task
//Each task has a name and a status
class Task{
  String name;
  //DateTime due;
  bool completed;

  Task(this.name, this.completed);
}


class AppViewModel extends ChangeNotifier{
  //start with an empty list of tasks
  List<Task> tasks = <Task>[];
  CurrentUser user = CurrentUser("Alexander");

  Color firstSection = const Color.fromARGB(255, 193, 238, 199);
  Color secondSection = const Color.fromARGB(255, 99, 206, 103);
  Color thirdSection = const Color.fromARGB(255, 46, 173, 50);
  Color fourthSection = const Color.fromARGB(255, 11, 104, 15);

  String get username => user.username;


  int get numTasks => tasks.length;

  int get remainingTasks => tasks.where((task) => !task.completed).length;

  void deleteTask(int taskIndex){
    tasks.removeAt(taskIndex);
    notifyListeners();
  }

  void addTask(Task newTask){
    tasks.add(newTask);
    notifyListeners();
  }

  bool getTaskState(int taskIndex){
    return tasks[taskIndex].completed;
  }

  String getTaskTitle(int taskIndex){
    return tasks[taskIndex].name;
  }

  void setTaskValue(int taskIndex, bool taskState){
    tasks[taskIndex].completed = taskState;
    notifyListeners();
  }

  void lowerSection(Widget bottomSheetView, BuildContext context){
    showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //barrierColor: Colors.amber,
    clipBehavior: Clip.antiAliasWithSaveLayer,
     builder: ((context){
        return bottomSheetView;
     }));

  }





} 

