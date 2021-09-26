import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:productivityapp/src/views/utils/transition.dart';
import 'package:productivityapp/src/views/utils/constants.dart';
import 'package:productivityapp/src/views/ui/home.dart';

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

  String notif_type = "Scheduled";
  bool random_notifs = false;
  int interval = 90;
  int times = 10;

  final start_controller = TextEditingController();
  final stop_controller = TextEditingController();
  final rand_n_sched_controller = TextEditingController();


  void _submitSettings() {
    Navigator.of(context).pushReplacement(FadePageRoute(
      builder: (context) => const Home(title: Constants.appName),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomInset: false, 
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text("Notification Settings", style: TextStyle(fontSize: 25)),
          SizedBox(height: 30),
          Text("Notifications Time Start"),
          SizedBox(height: 30),
          SizedBox(
            width: 300,
            child: TextField(
              controller: this.start_controller,
            ),
          ),
          SizedBox(height: 30),
          Text("Notifications Time End"),
          SizedBox(height: 30),
          SizedBox(
            width: 300,
            child: TextField(
              controller: this.stop_controller,
            ),
          ),
          SizedBox(height: 30),
          Text("${notif_type}"),
          SizedBox(height: 10),
          FlutterSwitch(
            value: random_notifs,
            showOnOff: true,
            onToggle: (val) {
              setState(() {
                random_notifs = val;
                notif_type = val ? "Scheduled" : "Random";
              });
            },
          ),
          SizedBox(height: 30),
          Text("Interval/ Times per day"),
          SizedBox(height: 30),
          SizedBox(
            width: 300,
            child: TextField(
              controller: this.rand_n_sched_controller,
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              _submitSettings();
            },
            child: const Text('Accept Changes'),
          ),
        ]
      ),
    );
  }
}
