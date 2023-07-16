import 'package:flutter/material.dart';
import 'package:flutter_application_4/pages/todolistPage.dart';
import 'package:flutter_application_4/pages/usersPage.dart';

class navigatorPage extends StatefulWidget {
  const navigatorPage({super.key});

  @override
  State<navigatorPage> createState() => _navigatorPageState();
}

class _navigatorPageState extends State<navigatorPage> {
  int myIndex = 0;
  List<Widget> widgetList=const [
    usersPage(),//Text('Users', style: TextStyle(fontSize: 40)),
    todolistPage(),//Text('Todo List', style: TextStyle(fontSize: 40)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  IndexedStack(
        children: widgetList,
        index: myIndex,
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
            myIndex=index;
          });
        },
        currentIndex: myIndex,
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