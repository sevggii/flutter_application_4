import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter_application_4/pages/navigatorPage.dart';

class LoginController extends GetxController {
  final storage = FlutterSecureStorage();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

   signUserIn() async {
    const url = 'https://reqres.in/api/login';
    
    // Get username and password that user enters
    final username = usernameController.text; //'eve.holt@reqres.in';
    final password = passwordController.text; //'cityslicka';
    
    final response =
        await http.post(Uri.parse(url), body: {'username': username, 'password': password});

    if (response.statusCode == 200) {
      saveLoginData(username.toString(), password.toString());
      fetchLoginData();
    } else {
      Get.dialog(
      AlertDialog(
        title: Text("Wrong password"),
        content: Text("Invalid username or password, please try again :("),
        actions: [
          TextButton(
            child: Text("Okay"),
            onPressed: () => Get.back(),
          ),
        ],
      ),
      barrierDismissible: false,
    );
      /*Get.snackbar(
      "Incorrect password",
      "Username or password is wrong, please try again :( ",
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 3));*/
    }
  }

  void saveLoginData(String? username, String? password) async {
     try {
       await storage.write(key: "username", value: '${username ?? ''}');
       await storage.write(key: "password", value: '${password ?? ''}');

       print("Data saved");
      
       Get.off(navigatorPage());
     } catch (e) { 
       print("Hata oluştu $e");
     }
   }

 Future<void> fetchLoginData() async { 
   String? storedUsername = await storage.read(key:"username");
   String? storedPassword=await storage.read(key:"password");

   if(storedUsername!=null&&storedPassword!=null){
     print("Welcome : $storedUsername");
   }else{
     print("Username / Password incorrect: (");
   }
 }

}