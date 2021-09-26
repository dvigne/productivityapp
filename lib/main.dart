import 'package:http/http.dart' as http;
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter/material.dart';
import 'package:productivityapp/src/app.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final FlutterAppAuth appAuth = FlutterAppAuth();
final FlutterSecureStorage secureStrage = const FlutterSecureStorage();

// auth0 variables
const AUTH0_DOMAIN = 'dev-zkvsx4x2.us.auth0.com';
const AUTH0_CLIENT_ID = 'IkTtNYGIMwHofIOZL7b3kza0JAeM35Pf';

const AUTH0_REDIRECT_URI = 'https://busybuddy.app';
const AUTH0_ISSUER = 'https://dev-zkvsx4x2.us.auth0.com';

void main() {
  runApp(const ProductivityApp());
}