import 'package:flutter/material.dart';
import 'package:flutter_application_4/controllers/main_controller.dart';
import 'package:flutter_application_4/pages/loginPage.dart';
import 'package:flutter_application_4/pages/navigatorPage.dart';
import 'package:get/get.dart';
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

   MyApp({Key? key, this.username, this.password}) : super(key: key);

  final _mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    if (username != null && password != null) {
      return GetMaterialApp(
        home: navigatorPage(),
      );
    } else { 
      return GetMaterialApp(
        home: LoginPage(),
      );
    }
  }
}