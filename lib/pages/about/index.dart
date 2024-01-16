// 关于我的
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // 设置信号栏的底色为白色
      statusBarIconBrightness: Brightness.dark, // 设置信号栏字体颜色为黑色
    ));
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
