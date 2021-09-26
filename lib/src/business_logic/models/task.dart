import 'package:flutter/material.dart';

class TaskList {

  List<_Task> _tasks = [];

  TaskList.fromJson(Map<String, dynamic> parsedJson) {
    List<_Task> temp = [];
    for (int i = 0; i < parsedJson['tasks'].length; i++) {
      _Task result = _Task(parsedJson['results'][i]);
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

  _Task(task) {
    _name = task['name'];
    _description = task['description'];
  }

  String get name => _name;
  String get description => _description;
}
