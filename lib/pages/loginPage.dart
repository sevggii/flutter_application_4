import 'package:flutter/material.dart';
import 'package:flutter_application_4/components/my_button.dart';
import 'package:flutter_application_4/components/my_textfield.dart';
import 'package:flutter_application_4/components/square_tile.dart';

class LoginPage extends StatelessWidget {
   LoginPage({Key? key});

  //text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              //logo
              const Icon(
                Icons.lock,
                size: 100,
              ),

              const SizedBox(height: 50),

              //Welcome
              Text(
                'Welcome back you\'ve been missed!',
                style:
                    TextStyle(color: Colors.grey[700], fontSize: 16),
              ),

              const SizedBox(height:25),

               //username textfield 
               MyTextField( 
                 controller : usernameController ,
                 hintText : "Username" , 
                 obscureText : false ,
               ), 

               const SizedBox(height :10), 

               //password textfield 
               MyTextField(  
                  controller : passwordController ,
                  hintText :'Password' , 
                  obscureText:true,

                ), 
             ],
           ),
         ),
       ),
     );
   }
}