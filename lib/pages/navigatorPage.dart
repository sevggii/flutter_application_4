import 'package:flutter/material.dart';

class navigatorPage extends StatefulWidget {
  const navigatorPage({super.key});

  @override
  State<navigatorPage> createState() => _navigatorPageState();
}

class _navigatorPageState extends State<navigatorPage> {
  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar'),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Todo List'
        ),
      ],
      ),
    );
  }
}