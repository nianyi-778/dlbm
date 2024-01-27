// 关于我的
import 'package:dlbm/utils/utils.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});
  @override
  State<About> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<About> {
  @override
  void initState() {
    super.initState();
    print('about mount...');
  }

  void dispose() {
    print('about unmount');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarStyle(Colors.white, Colors.black);
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0, //去除状态栏下的一条阴影
          title: const Text(
            '关于我的',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Container(child: Text('关于我的')));
  }
}
