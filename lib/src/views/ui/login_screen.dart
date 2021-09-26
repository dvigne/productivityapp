import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:productivityapp/src/views/utils/constants.dart';
import 'package:productivityapp/src/business_logic/models/mock_users.dart';
import 'package:productivityapp/src/views/utils/transition.dart';

import 'home.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  Future<String?> _loginUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      //testing
      return null;
      if (!mockUsers.containsKey(data.name)) {
        return 'User not exists';
      }
      if (mockUsers[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }
=======
>>>>>>> Stashed changes

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:productivityapp/main.dart';
import 'package:productivityapp/src/app.dart';




class Login extends StatelessWidget
{
  final loginAction;
  final String loginError;

  const Login(this.loginAction, this.loginError);

  @override
  Widget build(BuildContext context)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          onPressed: ()
          {
            loginAction();
          },
          child: Text('Login'),
        ),
        Text(loginError ?? ''),
      ],
    );
  }
}

class MyAppState extends State <ProductivityApp>
{
  bool isBusy = false;
  bool isLoggedIn = false;
  String errorMessage = 'damn';
  String name;
  String picture;

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Auth0 Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Autho0 Demo'),
        ),
        body: Center(
          child: isBusy
              ? CircularProgressIndicator()
              : isLoggedIn
                ? Profile(logoutAction, name, picture)
                : Login(loginAction, errorMessage),
        ),
      ),
    );
  }
  // parses json file to generate a token
  Map<String, dynamic> parseIdToken(String idToken)
  {
    final parts = idToken.split(r'.');
    assert(parts.length == 3);

    return jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));

  }
  // gets the user details using an accessToken will need to be taken around the project for further calls
  Future<Map<String, dyanmic>> getUserDetails(String accessToken) async
  {
    final url = 'https://dev-zkvsx4x2.us.auth0.com/userinfo';
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200)
    {
        return jsonDecode(response.body);
    }

    else
    {
      throw Exception('Failed to get user details');
    }
  }
  // logs in user with appAuth.authorizeAndExchangeCode()
  Future<void> loginAction() async
  {
    setState(()
    {
      isBusy = true;
      errorMessage = '';
    });

    try
    {
      // create an authorizationTokenResponse object this is sent into appAuth
      // to iniate a sign in transaction
      final AuthorizationTokenResponse? result =
          await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
            AUTH0_CLIENT_ID, // clientID
            AUTH0_REDIRECT_URI, // redirect Uri busybuddy
            issuer: 'https://dev-zkvsx4x2.us.auth0.com',
            scopes: ['openid', 'profile', 'offline_access'], // actions that the user allows that app to do
            // promptValue: ['login']
        ),
      );

      // we can now access three tokens, an acessToken that can call API's
      // an idToken which is user info in JWT format
      // and refresh token which can be used to obtain a new accessToken and idToken
      final idToken = parseIdToken(result.idToken);
      final profile = await getUserDetails(result.accessToken);

      await secureStorage.write(
        key: 'refresh_token', value: result.refreshToken);
      // set the user's status as logged in
      setState(() {
        isBusy= false;
        isLoggedIn = true;
        name = idToken['name'];
        picture = profile['picture'];
      });
    }
    // catches a failed login and turns the user 'offline'
    catch (e, s)
    {
      print('login error: $e - stack: $s');

      setState(() {
        isBusy = false;
        isLoggedIn = false;
        errorMessage = e.toString();
      });
    }
  }
  // removes the refresh token from storage and sets state as logged out
  void logoutAction() async
  {
    await secureStorage.delete(key: 'refresh_token');
    setState(() {
      isLoggedIn = false;
      isBusy = false;
    });
  }

  @override
  void initState()
  {
    initAction();
    super.initState();
  }

  // checks for a refreshToken currently existing, if so a new accessToken is retrieved
  void initAction() async
  {
    final storedRefreshToken = await secureStorage.read(key: 'refresh_token');
    if (storedRefreshToken == null) return;

    setState(() {
      isBusy = true;
    });

    try
    {
      final response = await appAuth.token(TokenRequest(
        AUTH0_CLIENT_ID,
        AUTH0_REDIRECT_URI,
        issuer: AUTH0_ISSUER,
        refreshToken: storedRefreshToken,
      ));

      final idToken = parseIdToken(response.idToken);
      final profile = await getUserDetails(response.accessToken);

      secureStorage.write(key: 'refresh_token', value: response.refreshToken);

      setState(() {
        isBusy = false;
        isLoggenIn = true;
        name = idToken['name'];
        picture = profile['picture'];
      });
    }
    catch (e, s)
    {
      print('error on refresh token: $e - stack: $s');
      logoutAction();
    }
  }
}