import 'package:flutter/material.dart';

class Shopping extends StatefulWidget {
  const Shopping({super.key});

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('shopping'),
      ),
      body: const Text(
        'Welcome to shopping',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
