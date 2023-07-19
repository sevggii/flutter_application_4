import 'package:flutter/material.dart';
import 'package:flutter_application_4/controllers/navigator_controller.dart';
import 'package:flutter_application_4/pages/todolistPage.dart';
import 'package:flutter_application_4/pages/usersPage.dart';
import 'package:get/get.dart';

class navigatorPage extends StatefulWidget {
  const navigatorPage({super.key});

  @override
  State<navigatorPage> createState() => _navigatorPageState();
}

class _navigatorPageState extends State<navigatorPage> {
  List<Widget> widgetList=const [
    UsersPage(),//Text('Users', style: TextStyle(fontSize: 40)),
    ToDoListPage(),//Text('Todo List', style: TextStyle(fontSize: 40)),
  ];

  final _navigatorController = Get.put(NavigatorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  IndexedStack(
        children: widgetList,
        index: _navigatorController.myIndex.value,
        ),
     // appBar: AppBar(
       // title: const Text('Bottom Navigation Bar'),
      //),
      bottomNavigationBar: BottomNavigationBar(
        //showSelectedLabels: false,
        showUnselectedLabels: false,
        //backgroundColor: Colors.indigo,
        type: BottomNavigationBarType.fixed,//shifting,
        onTap: (index){
          setState(() {
            _navigatorController.myIndex.value=index;
          });
        },
        currentIndex: _navigatorController.myIndex.value,
        items:const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Users',
          //backgroundColor: Colors.amber
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Todo List',
          //backgroundColor: Colors.indigo
        ),
      ],
      ),
    );
  }
}