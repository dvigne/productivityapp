import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:productivityapp/src/business_logic/models/task.dart';

import 'package:flutter/services.dart' show rootBundle;

class TaskListProvider {
  Client client = Client();
  final _apiKey = 'your_api_key';

  Future<TaskList> fetchTasks() async {
    // print("entered");
    // final response = await client
    //     .get(Uri.parse("http://api.busybuddy.app/3/tasks?api_key=$_apiKey"));
    // print(response.body.toString());
    // if (response.statusCode == 200) {
    //   // If the call to the server was successful, parse the JSON
    //   return TaskList.fromJson(json.decode(response.body));
    //   // If that call was not successful, throw an error.
    //   throw Exception('Failed to load post');
    // }
    print(json.decode("{'tasks':[{'name':'task 1','description':'null'},{'name':'task 2', 'description':'null2'}]}"));
    return TaskList.fromJson(json.decode("{'tasks':[{'name':'task 1','description':'null'},{'name':'task 2', 'description':'null2'}]}"));
  }
}