import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:productivityapp/src/views/utils/constants.dart';
// import 'custom_route.dart';
import 'home.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  // Future<String?> _loginUser(LoginData data) {
  //   return Future.delayed(loginTime).then((_) {
  //     if (!mockUsers.containsKey(data.name)) {
  //       return 'User not exists';
  //     }
  //     if (mockUsers[data.name] != data.password) {
  //       return 'Password does not match';
  //     }
  //     return null;
  //   });
  // }
  //
  // Future<String?> _recoverPassword(String name) {
  //   return Future.delayed(loginTime).then((_) {
  //     if (!mockUsers.containsKey(name)) {
  //       return 'User not exists';
  //     }
  //     return null;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    /*
    * temp view
     */
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(Constants.appName + ": Login"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Login Screen',
            ),
            Text(
              'testing',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
    // return FlutterLogin(
    //   title: Constants.appName,
    //   logo: 'assets/images/ecorp.png',
    //   logoTag: Constants.logoTag,
    //   titleTag: Constants.titleTag,
    //   navigateBackAfterRecovery: true,
    //   loginProviders: [
    //     LoginProvider(
    //       icon: FontAwesomeIcons.google,
    //       label: 'Google',
    //       callback: () async {
    //         print('start google sign in');
    //         await Future.delayed(loginTime);
    //         print('stop google sign in');
    //         return '';
    //       },
    //     ),
    //     LoginProvider(
    //       icon: FontAwesomeIcons.linkedinIn,
    //       label: 'LinkedIn',
    //       callback: () async {
    //         print('start linkdin sign in');
    //         await Future.delayed(loginTime);
    //         print('stop linkdin sign in');
    //         return '';
    //       },
    //     ),
    //     LoginProvider(
    //       icon: FontAwesomeIcons.githubAlt,
    //       callback: () async {
    //         print('start github sign in');
    //         await Future.delayed(loginTime);
    //         print('stop github sign in');
    //         return '';
    //       },
    //     ),
    //   ],
      // hideProvidersTitle: false,
      // loginAfterSignUp: false,
      // hideForgotPasswordButton: true,
      // hideSignUpButton: true,
      // disableCustomPageTransformer: true,
      // messages: LoginMessages(
      //   userHint: 'User',
      //   passwordHint: 'Pass',
      //   confirmPasswordHint: 'Confirm',
      //   loginButton: 'LOG IN',
      //   signupButton: 'REGISTER',
      //   forgotPasswordButton: 'Forgot huh?',
      //   recoverPasswordButton: 'HELP ME',
      //   goBackButton: 'GO BACK',
      //   confirmPasswordError: 'Not match!',
      //   recoverPasswordIntro: 'Don\'t feel bad. Happens all the time.',
      //   recoverPasswordDescription: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
      //   recoverPasswordSuccess: 'Password rescued successfully',
      //   flushbarTitleError: 'Oh no!',
      //   flushbarTitleSuccess: 'Succes!',
      //   providersTitle: 'login with'
      // ),
      // theme: LoginTheme(
      //   primaryColor: Colors.teal,
      //   accentColor: Colors.yellow,
      //   errorColor: Colors.deepOrange,
      //   pageColorLight: Colors.indigo.shade300,
      //   pageColorDark: Colors.indigo.shade500,
      //   logoWidth: 0.80,
      //   titleStyle: TextStyle(
      //     color: Colors.greenAccent,
      //     fontFamily: 'Quicksand',
      //     letterSpacing: 4,
      //   ),
      //   // beforeHeroFontSize: 50,
      //   // afterHeroFontSize: 20,
      //   bodyStyle: TextStyle(
      //     fontStyle: FontStyle.italic,
      //     decoration: TextDecoration.underline,
      //   ),
      //   textFieldStyle: TextStyle(
      //     color: Colors.orange,
      //     shadows: [Shadow(color: Colors.yellow, blurRadius: 2)],
      //   ),
      //   buttonStyle: TextStyle(
      //     fontWeight: FontWeight.w800,
      //     color: Colors.yellow,
      //   ),
      //   cardTheme: CardTheme(
      //     color: Colors.yellow.shade100,
      //     elevation: 5,
      //     margin: EdgeInsets.only(top: 15),
      //     shape: ContinuousRectangleBorder(
      //         borderRadius: BorderRadius.circular(100.0)),
      //   ),
      //   inputTheme: InputDecorationTheme(
      //     filled: true,
      //     fillColor: Colors.purple.withOpacity(.1),
      //     contentPadding: EdgeInsets.zero,
      //     errorStyle: TextStyle(
      //       backgroundColor: Colors.orange,
      //       color: Colors.white,
      //     ),
      //     labelStyle: TextStyle(fontSize: 12),
      //     enabledBorder: UnderlineInputBorder(
      //       borderSide: BorderSide(color: Colors.blue.shade700, width: 4),
      //       borderRadius: inputBorder,
      //     ),
      //     focusedBorder: UnderlineInputBorder(
      //       borderSide: BorderSide(color: Colors.blue.shade400, width: 5),
      //       borderRadius: inputBorder,
      //     ),
      //     errorBorder: UnderlineInputBorder(
      //       borderSide: BorderSide(color: Colors.red.shade700, width: 7),
      //       borderRadius: inputBorder,
      //     ),
      //     focusedErrorBorder: UnderlineInputBorder(
      //       borderSide: BorderSide(color: Colors.red.shade400, width: 8),
      //       borderRadius: inputBorder,
      //     ),
      //     disabledBorder: UnderlineInputBorder(
      //       borderSide: BorderSide(color: Colors.grey, width: 5),
      //       borderRadius: inputBorder,
      //     ),
      //   ),
      //   buttonTheme: LoginButtonTheme(
      //     splashColor: Colors.purple,
      //     backgroundColor: Colors.pinkAccent,
      //     highlightColor: Colors.lightGreen,
      //     elevation: 9.0,
      //     highlightElevation: 6.0,
      //     shape: BeveledRectangleBorder(
      //       borderRadius: BorderRadius.circular(10),
      //     ),
      //     // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      //     // shape: CircleBorder(side: BorderSide(color: Colors.green)),
      //     // shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
      //   ),
      // ),
    //   userValidator: (value) {
    //     if (!value!.contains('@') || !value.endsWith('.com')) {
    //       return "Email must contain '@' and end with '.com'";
    //     }
    //     return null;
    //   },
    //   passwordValidator: (value) {
    //     if (value!.isEmpty) {
    //       return 'Password is empty';
    //     }
    //     return null;
    //   },
    //   onLogin: (loginData) {
    //     print('Login info');
    //     print('Name: ${loginData.name}');
    //     print('Password: ${loginData.password}');
    //     return _loginUser(loginData);
    //   },
    //   onSignup: (loginData) {
    //     print('Signup info');
    //     print('Name: ${loginData.name}');
    //     print('Password: ${loginData.password}');
    //     return _loginUser(loginData);
    //   },
    //   onSubmitAnimationCompleted: () {
    //     Navigator.of(context).pushReplacement(FadePageRoute(
    //       builder: (context) => DashboardScreen(),
    //     ));
    //   },
    //   onRecoverPassword: (name) {
    //     print('Recover password info');
    //     print('Name: $name');
    //     return _recoverPassword(name);
    //     // Show new password dialog
    //   },
    //   showDebugButtons: true,
    // );
  }
}