import 'package:flutter/material.dart';
import 'package:productivityapp/src/views/ui/home.dart';
import 'package:productivityapp/src/views/ui/login_screen.dart';
import 'package:productivityapp/src/views/utils/constants.dart';


class ProductivityApp extends StatelessWidget {
  const ProductivityApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BusyBuddy',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green
        ,
      ),
      home: const Home(title: Constants.appName),
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        Home.routeName: (context) => Home(title: Constants.appName),
      },
    );
  }
}
