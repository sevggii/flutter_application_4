import 'package:flutter/material.dart';

class usersPage extends StatelessWidget {
  const usersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users list page')
      ),
      body: Center(child: const Text('First Page')),
    );
  }
}