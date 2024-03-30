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
        body: Container(
            padding: EdgeInsets.all(16.0), // 设置四个方向的内边距为16.0,
            child: Center(
              child: SizedBox(
                height: 400,
                child: Column(
                  children: [
                    Image.network(
                      'https://i0.hdslb.com/bfs/material_up/ba06e321884e0b9fa63486a62bd833dbff9d5f87.png', // 替换为你要显示的图片的URL
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('平平无奇程序员'),
                    Text(
                      '有事微信联系',
                      style: TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
            )));
  }
}
