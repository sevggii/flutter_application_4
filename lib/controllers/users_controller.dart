import 'dart:convert';
import 'package:flutter_application_4/pages/loginPage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UsersController extends GetxController {
  
  final storage = FlutterSecureStorage();

  List<Map<String, dynamic>> users = [];

  void fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData.containsKey('data')) { 
        users = List<Map<String, dynamic>>.from(jsonData['data']);
      } else {
        throw Exception('Invalid data format');
      }
    } else {
      throw Exception('Failed to fetch users');
    }
    
    update(); //send changes
  }

  Future<void> logout() async {
    await storage.deleteAll(); 

    Get.off(LoginPage());

     update();
   }

  @override
  void onInit() {
    super.onInit();
     fetchUsers();
   }
}