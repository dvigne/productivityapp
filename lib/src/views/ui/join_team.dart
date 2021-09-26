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

  /// -----------------------------------
  ///           Auth0 Variables
  /// -----------------------------------

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Teams> createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {


  void _joinTeam() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

    });
  }

  void _createTeam() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      /*
      create task and add to list
       */
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    TaskList tasks = TaskList();

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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
        onPressed: _addTask,
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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


