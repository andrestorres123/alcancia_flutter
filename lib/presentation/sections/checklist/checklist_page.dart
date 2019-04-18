import 'package:alcancia_flutter/model/task.dart';
import 'package:alcancia_flutter/presentation/sections/checklist/widgets/category_dropdown.dart';
import 'package:alcancia_flutter/presentation/sections/checklist/widgets/picture_checklist.dart';
import 'package:alcancia_flutter/presentation/sections/checklist/widgets/progress_view.dart';
import 'package:alcancia_flutter/presentation/sections/checklist/widgets/task_list.dart';
import 'package:alcancia_flutter/presentation/sections/checklist/widgets/title_textfield.dart';
import 'package:alcancia_flutter/presentation/sections/checklist/widgets/users_list.dart';
import 'package:flutter/material.dart';

class ChecklistPage extends StatefulWidget {
  @override
  _ChecklistPage createState() => _ChecklistPage();
}

class _ChecklistPage extends State<ChecklistPage> {
  final users = [
    'Andres Torres',
    'Rafael Leon',
    'David Baez',
    'Pablo Valdez',
    'Matthew Silver'
  ];
  final progress = 0.25;
  final tasks = Task.getTasks();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Alcancia',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black54,
      ),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                color: Colors.lightGreen,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 4.0),
                      child: TitleTextfield(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 4.0, bottom: 32.0),
                      child: CategoryDropDown(),
                    ),
                  ],
                ),
              ),
              PictureChecklist(),
              UsersList(users: users),
              ProgressView(progress: progress),
              TaskList(tasks: tasks)
            ],
          ),
        ],
      ),
    );
  }
}
