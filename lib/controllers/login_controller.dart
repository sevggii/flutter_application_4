import 'package:flutter/cupertino.dart';
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
    final username = usernameController.text;
    final password = passwordController.text;
    
    // login request
    final response =
        await http.post(Uri.parse(url), body: {'username': username, 'password': password});

    if (response.statusCode == 200) {
      saveLoginData(username.toString(), password.toString());
      fetchLoginData();
    } else {
      print('Incorrect username / Password :(');
    }
  }

  void saveLoginData(String? username, String? password) async {
     try {
       await storage.write(key: "username", value: '${username ?? ''}');
       await storage.write(key: "password", value: '${password ?? ''}');

       print("Data saved");
      
       Get.to(navigatorPage());
     } catch (e) { 
       print("Hata oluştu $e");
     }
   }

 Future<void> fetchLoginData() async { 
   String? storedUsername = await storage.read(key:"username");
   String? storedPassword=await storage.read(key:"password");

   if(storedUsername!=null&&storedPassword!=null){
     print("Welcome : $storedUsername");

         /* showDialog(
           context: context,
           builder:(BuildContext dialogContext){
             return AlertDialog(
               title : Text('Saved User Information'),
               content : Column(
                 crossAxisAlignment : CrossAxisAlignment.start,
                 children:[
                   Text('Username : $storedUsername'),
                   Text('PAssword : $storedPassword'),
                 ],
               ),
               actions:<Widget>[
                 TextButton(
                   child :Text('Okay'),
                   onPressed : () { 
                     Navigator.of(dialogContext).pop();
                   },
                 ),
               ],
             );
           }
         );*/
   }else{
     print("Username / Password incorrect: (");
   }
 }

}