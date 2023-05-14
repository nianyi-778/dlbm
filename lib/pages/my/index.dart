import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  // const HomePage({super.key, required this.title});
  const MyApp({super.key});

  // final String title;

  @override
  State<MyApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: const Text(
        'Welcome to Flutter',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
