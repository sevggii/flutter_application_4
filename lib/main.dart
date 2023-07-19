import 'package:flutter/material.dart';
import 'package:flutter_application_4/controllers/main_controller.dart';
import 'package:flutter_application_4/pages/loginPage.dart';
import 'package:flutter_application_4/pages/navigatorPage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final _mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    if (_mainController.username != null && _mainController.password != null) {
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