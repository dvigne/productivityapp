import '../services/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/task.dart';

class TasksBloc {
  final _repository = Repository();
  final _tasksFetcher = PublishSubject<TaskList>();

  Stream<TaskList> get allTasks => _tasksFetcher.stream;

  fetchAllTasks() async {
    TaskList taskList = await _repository.fetchAllTasks();
    _tasksFetcher.sink.add(taskList);
  }

  dispose() {
    _tasksFetcher.close();
  }
}

final bloc = TasksBloc();