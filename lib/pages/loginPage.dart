import 'package:flutter/material.dart';
import 'package:flutter_application_4/components/my_button.dart';
import 'package:flutter_application_4/components/my_textfield.dart';
import 'package:flutter_application_4/components/square_tile.dart';
import 'package:flutter_application_4/pages/navigatorPage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final storage = new FlutterSecureStorage();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void signUserIn() async {
  const url = 'https://reqres.in/api/login';
  
  // Get username and password that user enters
  final username = usernameController.text;
  final password = passwordController.text;

  // login request
  final response = await http.post(Uri.parse(url), body: {
    'username': 'eve.holt@reqres.in',//username,
    'password': 'cityslicka' //password,
  });

  if (response.statusCode == 200) {
    saveLoginData('eve.holt@reqres.in','cityslicka');//username,password
    fetchLoginData();
    
   } else {
     print('Incorrect username / Password :(');
   }
  }

  void saveLoginData(String username, String password) async {
  try {
    await storage.write(key: "username", value: username);
    await storage.write(key: "password", value: password);

    final snackBar = SnackBar(content: Text('Login is successful! :)'));
    print("Data saved");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => navigatorPage()));

    setState(() {});
  } catch (e) {
      print("Hata oluştu: $e");
  }
}

Future<void> fetchLoginData() async { 
  String? storedUsername = await storage.read(key: "username");
  String? storedPassword = await storage.read(key: "password");

  if (storedUsername != null && storedPassword != null) {
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
   } else {
      print("Username / Password incorrect: (");
   }
}

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
               style: TextStyle(color:Colors.grey[700],
               fontSize: 16,
               ),
            ),

            const SizedBox(height: 25),
              
            //username textfield
            MyTextField(
              controller: usernameController,
              hintText: 'Username',
              obscureText: false,
            ),

            const SizedBox(height: 10),
              
            //password textfield
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
               
            ),

             const SizedBox(height: 10),
             
             //forgot password?
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 25.0),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Text('Forgot Password?',
                   style: TextStyle(color: Colors.grey[600]),
                   ),
                 ],
               ),
             ),

             const SizedBox(height: 25),
              
            //sign in button 
            MyButton(
              onTap: signUserIn,
            ),

            const SizedBox(height: 50),
              
            //or continue with
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('Or continue with',
                    style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),
              
            //google + apple sign in buttons
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              //google button
              SquareTile(imagePath: 'lib/images/google.png'),

              SizedBox(width: 25),

              //apple button
              SquareTile(imagePath: 'lib/images/apple.png')
            ],
           ),

           const SizedBox(height: 50),

            //not a remember? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a remember?',
                  style: TextStyle(color: Colors.grey[700]),
                  ),
                const SizedBox(width: 4),
                const Text(
                  'Register now',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            )
              
          ],
          ),
        ),
      ),
    );
  }
}