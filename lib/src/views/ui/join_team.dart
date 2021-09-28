import 'package:flutter/material.dart';
import 'package:productivityapp/src/business_logic/models/task.dart';
import 'package:productivityapp/src/views/utils/transition.dart';
import 'package:productivityapp/src/views/utils/constants.dart';
import 'package:productivityapp/src/views/ui/notification_settings.dart';
import 'package:http/http.dart' show Client, Response;
import 'dart:async';
import 'dart:convert';

class Teams extends StatefulWidget {
  static const routeName = '/home';
  const Teams({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Teams> createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {


  void _joinTeam() {
    setState(() {

    });
  }

  void _createTeam() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    TaskList tasks = TaskList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.menu),
              tooltip: 'Notification Settings',
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const NotificationSettings(title: Constants.appName),
                ));
              }
          ),
        ],
      ),
      body: FutureBuilder<TaskList> (
        future: downloadData(),
        initialData: tasks,
        builder: (context, AsyncSnapshot<TaskList> snapshot) {
          print(snapshot.connectionState);
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator(
                  backgroundColor: Colors.amber, strokeWidth: 1),);
            default:
              if (snapshot.hasData) {
                print(snapshot.data);
                return buildList(snapshot.data!);
              } else return Text("no data");
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _joinTeam,
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildList(TaskList tl) {
    return Column(
        children: tl.tasks.map(
                (item) => Text(
                item.name
            )
        ).toList());
  }

  Future<TaskList> downloadData() async {
    Client client = Client();
    Response response;
    response =  await client.get(Uri.parse('https://busybuddy.app/api/task'));
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

}
