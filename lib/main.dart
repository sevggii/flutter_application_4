import 'package:flutter/material.dart';
import 'package:flutter_application_4/pages/loginPage.dart';
import 'package:flutter_application_4/pages/navigatorPage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final storage = FlutterSecureStorage();
  final username = await storage.read(key: "username");
  final password = await storage.read(key: "password");

  runApp(MyApp(username: username, password: password));
}

class MyApp extends StatelessWidget {
  final String? username;
  final String? password;

  const MyApp({Key? key, this.username, this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (username != null && password != null) {
      return MaterialApp(
        home: navigatorPage(),
      );
    } else { 
      return MaterialApp(
        home: LoginPage(),
      );
    }
  }
}