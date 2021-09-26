import 'package:flutter/material.dart';

class NotificationSettings extends StatefulWidget {
  static const routeName = '/notifications';
  const NotificationSettings({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {

  String start_time = "";
  String stop_time = "";
  bool random_notifs = false;
  int interval = 90;
  int times = 10;

  final start_controller = TextEditingController();
  final stop_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Text("Notification Settings"),
          Text("Notifications Time Start"),
          TextField(
            controller: this.start_controller,
          ),
          Text("Notifications Time End"),
          TextField(
            controller: this.stop_controller,
          ),
          Text("Random or Scheduled"),

          Text("Interval/ Times per day")
        ]
      ),
    );
  }
}