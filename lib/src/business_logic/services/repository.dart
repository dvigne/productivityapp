import 'dart:async';
import 'tasklist_provider.dart';
import '../models/task.dart';

class Repository {
  final taskListProvider = TaskListProvider();

  Future<TaskList> fetchAllTasks() => taskListProvider.fetchTasks();
}