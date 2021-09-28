import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:productivityapp/src/views/utils/transition.dart';
import 'package:productivityapp/src/views/utils/constants.dart';
import 'package:productivityapp/src/views/ui/home.dart';


class NotificationSettings extends StatefulWidget {
  static const routeName = '/notifications';
  const NotificationSettings({Key? key, required this.title}) : super(key: key);

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
    if(true) { // success

      Navigator.of(context).pushReplacement(FadePageRoute(
        builder: (context) => const Home(title: Constants.appName),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () {
            Navigator.of(context).pushReplacement(FadePageRoute(
              builder: (context) => const Home(title: Constants.appName),
            ));
          },
        )
      ]
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
            showOnOff: false,
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
