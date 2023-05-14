import 'package:flutter/material.dart';

class Toolbox extends StatefulWidget {
  const Toolbox({super.key});

  @override
  State<Toolbox> createState() => _ToolboxState();
}

class _ToolboxState extends State<Toolbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('_ToolboxState'),
      ),
      body: const Text(
        'Welcome to _ToolboxState',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
