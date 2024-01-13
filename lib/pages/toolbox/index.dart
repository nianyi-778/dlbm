import 'package:flutter/material.dart';
import 'package:dlbm/pages/toolbox/components/ClassificationTools.dart';
import 'package:flutter/services.dart';

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
        appBar: AppBar(
          elevation: 0, //去除状态栏下的一条阴影
          title: const Text(
            '实用工具',
          ),
          centerTitle: true,
        ), // 隐藏了app Bar
        body: SafeArea(
            child: Container(
                constraints: const BoxConstraints.expand(),
                width: MediaQuery.of(context).size.width,
                child: ListView(children: const [
                  Column(
                    children: [ClassificationTools()],
                  ),
                ]))));
  }
}
