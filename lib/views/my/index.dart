import 'package:flutter/material.dart';
import 'package:dlbm/views/my/components/Header.dart';
import 'package:dlbm/views/my/components/CardList.dart';

class MyApp extends StatefulWidget {
  final Function() onUpdateIndex;
  const MyApp({Key? key, required this.onUpdateIndex}) : super(key: key);

  // final String title;

  @override
  State<MyApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  late bool isLogin;

  @override
  void initState() {
    super.initState();
    isLogin = false; // 初始化 isLogin 字段为 false
    print('mount...');
  }

  @override
  void dispose() {
    print('unmount');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0, //去除状态栏下的一条阴影
          toolbarHeight: 0,
          backgroundColor: Colors.white,
        ), // 隐
        body: Container(
          margin: const EdgeInsets.fromLTRB(15, 25, 15, 15),
          width: double.infinity,
          color: Colors.transparent,
          child: SafeArea(
            child: Column(
              children: [
                const MyHeader(),
                CardList(onUpdateIndex: widget.onUpdateIndex)
              ],
            ),
          ),
        ));
  }
}

/**
 
 Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 45, 15, 15),
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
        )

 * */
