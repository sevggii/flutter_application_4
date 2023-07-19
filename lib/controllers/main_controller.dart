import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MainController extends GetxController {
  final storage = FlutterSecureStorage();
  String? username;
  String? password;

  MainController() {
    _loginCheck();
  }

  void _loginCheck() async {
    username = await storage.read(key: "username");
    password = await storage.read(key: "password");
  }
}