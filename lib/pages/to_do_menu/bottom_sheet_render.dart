import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ndhulite/pages/to_do_menu/task_setup.dart';
import 'package:provider/provider.dart';

class AddTaskBottomView extends StatelessWidget {
  const AddTaskBottomView({super.key});

  @override
  //keeps track of the text within the text field
  Widget build(BuildContext context) {
    final TextEditingController entryController = TextEditingController();
    return Consumer<AppViewModel>(builder: (context, appModel, child) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 70,
          //color of the box surrounding the inner box when adding task dialogue
          color: Colors.green.shade200,
          child: Center(
            child: SizedBox(
              height: 40,
              width: 320,
              child: TextField(
                onSubmitted:(value) {
                  if(entryController.text.isNotEmpty){
                    Task newTask = Task(entryController.text, false);
                    appModel.addTask(newTask);
                    entryController.clear();
                  }
                  Navigator.of(context).pop();
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 5),
                    filled: true,
                    //color for the box holding the text in the adding task dialogue
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(width: 0, style: BorderStyle.none))),
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                cursorColor: appModel.fourthSection,
                style:
                    TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),
                autofocus: true,
                autocorrect: false,
                controller: entryController,
              ),
            ),
          ),
        ),
      );
    });
  }
}
