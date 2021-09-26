import 'package:flutter/material.dart';

class TaskList {

  List<_Task> _tasks = [];

  TaskList(){}

  TaskList.fromJson(List<dynamic> parsedJson) {
    print('test');
    List<_Task> temp = [];
    for (int i = 0; i < parsedJson.length; i++) {
      _Task result = _Task(parsedJson[i]);
      temp.add(result);
    }
    _tasks = temp;
  }

  addTask(task) {
    _tasks.add(_Task(task));
  }

  List<_Task> get tasks => _tasks;
}

class _Task {
  String _name = "";
  String _description = "";
  String _id = "";

  _Task(task) {
    _name = task['name'];
    _description = task['description'];
    _id = task['id'];
  }

  String get id => _id;
  String get name => _name;
  String get description => _description;
}
