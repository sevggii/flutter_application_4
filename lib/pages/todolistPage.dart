import 'package:flutter/material.dart';

class todolistPage extends StatelessWidget {
  const todolistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo list page')
      ),
      body: Center(child: const Text('Second Page')),
    );
  }
}