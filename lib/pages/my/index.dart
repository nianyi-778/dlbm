import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dlbm/pages/my/components/Header.dart';
import 'package:dlbm/pages/my/components/CardList.dart';

class MyApp extends StatefulWidget {
  // const HomePage({super.key, required this.title});
  const MyApp({super.key});

  // final String title;

  @override
  State<MyApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.red, // 设置状态栏的背景颜色
      // 其他样式设置
    ));
  }

  @override
  void dispose() {
    SystemChrome.restoreSystemUIOverlays(); // 恢复系统UI样式
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  width: double.infinity,
                  color: Colors.transparent,
                  child: const SafeArea(
                    child: Column(
                      children: [MyHeader(), CardList()],
                    ),
                  ),
                ),
              ],
            ))
          ],
        ));
  }
}
