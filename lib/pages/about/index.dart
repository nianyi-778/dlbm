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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white, // 设置状态栏背景颜色为白色
      statusBarIconBrightness: Brightness.dark, // 设置状态栏图标颜色为黑色
    ));
    return Scaffold(
        appBar: AppBar(
          elevation: 0, //去除状态栏下的一条阴影
          title: const Text(
            '关于我的',
          ),
          centerTitle: true,
        ),
        body: Container(child: Text('关于我的')));
  }
}
