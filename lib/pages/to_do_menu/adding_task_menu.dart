import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ndhulite/pages/to_do_menu/bottom_sheet_render.dart';
import 'package:ndhulite/pages/to_do_menu/task_setup.dart';
import 'package:provider/provider.dart';

class AddTaskMenu extends StatelessWidget {
  const AddTaskMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, appModel, child) {
        return SizedBox(
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: appModel.firstSection,
                foregroundColor: appModel.secondSection,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: () {
              appModel.lowerSection(
                  const AddTaskBottomView(), context);
            },
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        );
      },
    );
  }
}
