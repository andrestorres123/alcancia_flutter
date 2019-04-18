import 'package:alcancia_flutter/model/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;

  const TaskList({Key key, this.tasks}) : super(key: key);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Text('Tasks'),
        ),
        StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection("tasks").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Text("Error");

            return Column(
              children: snapshot.data.documents.map((doc) {
                return _buildListTile(Task.fromJson(doc.data));
              }).toList(),
            );
          },
        )
      ],
    );
  }

  Widget _buildListTile(Task task) {
    return Dismissible(
      background: Container(
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Align(
            alignment: FractionalOffset.centerRight,
            child: Icon(
              Icons.restore_from_trash,
              color: Colors.white,
            ),
          ),
        ),
        color: Colors.red,
      ),
      key: Key(task.title),
      child: ListTile(
        leading: Checkbox(
            value: task.isChecked,
            onChanged: (value) {
              setState(() {
                task.isChecked = value;
              });
            }),
        title: Text(task.title),
        trailing: IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
      ),
    );
  }
}
