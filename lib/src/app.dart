import 'package:flutter/material.dart';
import 'package:productivityapp/src/views/ui/home.dart';
import 'package:productivityapp/src/views/ui/test_login_screen.dart';
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
        primarySwatch: Colors.purple,
        primaryColor: const Color(0xFFA5A6F6),
        splashColor: const Color(0xFFA5A6F6),
        // Define the default font family.
        fontFamily: 'Work Sans',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
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
