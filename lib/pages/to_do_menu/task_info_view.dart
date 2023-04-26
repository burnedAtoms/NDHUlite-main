import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ndhulite/pages/to_do_menu/task_setup.dart';
import 'package:provider/provider.dart';

class TaskInfoView extends StatelessWidget {
  const TaskInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, appModel, child) {
      return Container(
        //color: Colors.green.shade400,
        decoration: BoxDecoration(
          color: Colors.green.shade400,
          //borderRadius: BorderRadius.circular(10)
        ),
        //borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        //margin: EdgeInsets.fromLTRB(13, 10, 13, 10),
        child: Row(
          children: [
            //Total Tasks
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(13, 10, 13, 10),
                decoration: BoxDecoration(
                    color: Colors.green.shade200,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: FittedBox(
                        child: Text("Total Tasks:",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Text("${appModel.numTasks}",
                            style: TextStyle(
                                fontSize: 32,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            //SizedBox(width: 20),
            //Remaining Tasks
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(13, 10, 13, 10),
                decoration: BoxDecoration(
                    color: Colors.green.shade200,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(children: [
                  
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: FittedBox(
                        child: Text("Remaining Tasks:",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16)),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Text("${appModel.remainingTasks}",
                            style: TextStyle(
                                fontSize: 32,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      );
    });
  }
}
