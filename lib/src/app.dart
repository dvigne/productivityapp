import 'package:flutter/material.dart';
import 'package:productivityapp/src/views/ui/home.dart';
import 'package:productivityapp/src/views/ui/login_screen.dart';
import 'package:productivityapp/src/views/ui/notification_settings.dart';
import 'package:productivityapp/src/views/utils/constants.dart';


class ProductivityApp extends StatelessWidget {
  const ProductivityApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const Home(title: Constants.appName),
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        Home.routeName: (context) => const Home(title: Constants.appName),
        NotificationSettings.routeName: (context) => const NotificationSettings(title: Constants.appName),
      },
    );
  }
}
