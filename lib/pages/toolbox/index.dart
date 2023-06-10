import 'package:flutter/material.dart';

class Toolbox extends StatefulWidget {
  const Toolbox({Key? key}) : super(key: key);

  @override
  State<Toolbox> createState() => _ToolboxState();
}

class _ToolboxState extends State<Toolbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.89),
        appBar: null, // 隐藏了app Bar
        body: SafeArea(
            child: Container(
          constraints: const BoxConstraints.expand(),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: const [Text('1')],
          ),
        )));
  }
}
