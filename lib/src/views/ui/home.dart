import 'package:flutter/material.dart';
import 'package:productivityapp/src/business_logic/models/task.dart';
import 'package:productivityapp/src/views/utils/transition.dart';
import 'package:productivityapp/src/views/utils/constants.dart';
import 'package:productivityapp/src/views/ui/notification_settings.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:http/http.dart' show Client, Response;
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  static const routeName = '/home';
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _TaskState();
}

class _TaskState extends State<Home> {

  String newTask = "";
  final newTaskController = TextEditingController();

  void _addTask(String task) async {
    setState(() {
      Client client = Client();
      Map<String, String> body = {
        "assigned" : "",
        "name" : task,
        "description" : "sample description",
        "category" : "Test",
        "status" : "to-do"
      };
      Future<Response> response = client.post(Uri.parse("https://busybuddy.app/api/task/"), body: body);
      print(response);
    });
  }

  void _removeTask(String id) {
    print("removing " + id);

    setState(() {
      Client client = Client();

      Future<Response> response = client.delete(Uri.parse('https://busybuddy.app/api/task/' + id));
      print(response);
    });
  }

  @override
  Widget build(BuildContext context) {

    TaskList tasks = TaskList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).splashColor,
        leading: const Image(
          image: NetworkImage('https://raw.githubusercontent.com/dvigne/productivityapp/master/assets/BusyBuddy_logo.png')
        ),
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.notifications_rounded),
              tooltip: 'Notification Settings',
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const NotificationSettings(title: Constants.appName),
                ));
              }),
        ],
      ),
      body: FutureBuilder<TaskList>(
        future: downloadData(),
        initialData: tasks,
        builder: (context, AsyncSnapshot<TaskList> snapshot) {
          print(snapshot.connectionState);
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(
                    backgroundColor: Colors.purple,
                    strokeWidth: 1),
              );
            default:
              if (snapshot.hasData) {
                return buildList(snapshot.data!);
              } else {
                return Text("no data");
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildTaskEntryDialog(context),
          );
        },
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget buildList(TaskList tl) {
    return ListView(
        children: tl.tasks
            .map((item) => Card(
                    child: ListTile(
                  trailing: IconButton(
                      icon: const Icon(Icons.close),
                      tooltip: "Mark Complete",
                      onPressed: () {
                        _removeTask(item.id);
                      }),
                  title: Text(item.name),
                  subtitle: Text(item.description),
                )))
            .toList());
  }

  Future<TaskList> downloadData() async {
    Client client = Client();
    Response response;
    response = await client.get(Uri.parse('https://busybuddy.app/api/task'));
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      print(json.decode(response.body.toString())[0]);
      TaskList tl = TaskList.fromJson(json.decode(response.body.toString()));
      return Future.value(tl);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Widget _buildTaskEntryDialog(BuildContext context) {
    return Dialog(
      child: Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10),
            const Text(
              "Create New Task",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                controller: newTaskController,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _addTask(newTaskController.text);
                  Navigator.of(context).pop();
                },
                child: Text("Submit"),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
