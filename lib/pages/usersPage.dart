import 'package:flutter/material.dart';
import 'package:flutter_application_4/pages/loginPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key});

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<Map<String, dynamic>> users = [];

  Future<void> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    if (response.statusCode == 200) {
      setState(() {
        final jsonData = json.decode(response.body);
        if (jsonData.containsKey('data')) { // data is in the correct format?
          users = List<Map<String, dynamic>>.from(jsonData['data']);
        } else {
          throw Exception('Invalid data format');
        }
      });
    } else {
      throw Exception('Failed to fetch users');
    }
  }

   @override
   void initState() { 
     super.initState();
     fetchUsers();
   }

   Widget build(BuildContext context) { 
     return Scaffold(
       appBar: AppBar(
         title: const Text('Users List'),
         actions: [
           IconButton(
             icon: Icon(Icons.logout),
             onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
              
             },
           ),
         ],
       ),
       body: ListView.builder(
         itemCount: users.length,
         itemBuilder:(context, index){
           final user = users[index];
           return ListTile(
             leading:
               CircleAvatar(backgroundImage: NetworkImage(user['avatar'])),
             title: Text('${user['first_name']} ${user['last_name']}'),
             subtitle: Text(user['email']),
           );
         },
       ),
     );
   }
}