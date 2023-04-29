import 'package:flutter/material.dart';
import "package:dlbm/components/Swiper.dart";
import 'package:dlbm/components/TextField.dart';
import 'package:dlbm/pages/home/components/Menu.dart';

class HomePage extends StatefulWidget {
  // const HomePage({super.key, required this.title});
  const HomePage({super.key});

  // final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: null, // 隐藏了app Bar
      body: Stack(
        children: <Widget>[
          Positioned(
            // banner 下面铺的底色
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 280,
              decoration: BoxDecoration(
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
          Container(
            constraints: const BoxConstraints.expand(),
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 26.0), // appBar
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  margin: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  child: MyTextField(),
                ),
                const CupertinoSwiper(
                  images: [
                    "https://easyv.assets.dtstack.com//data/3384/1819163/img/gjrwpsp3pq_1681286516293_6a3xpg1dqc.jpg?x-oss-process=image/resize,m_lfit,h_97,color_181b24",
                    "https://easyv.assets.dtstack.com//data/3384/1819163/img/gjrwpsp3pq_1681286516293_6a3xpg1dqc.jpg?x-oss-process=image/resize,m_lfit,h_97,color_181b24",
                    "https://easyv.assets.dtstack.com//data/3384/1819163/img/gjrwpsp3pq_1681286516293_6a3xpg1dqc.jpg?x-oss-process=image/resize,m_lfit,h_97,color_181b24",
                    "https://easyv.assets.dtstack.com//data/3384/1819163/img/gjrwpsp3pq_1681286516293_6a3xpg1dqc.jpg?x-oss-process=image/resize,m_lfit,h_97,color_181b24",
                    "https://easyv.assets.dtstack.com//data/3384/1819163/img/gjrwpsp3pq_1681286516293_6a3xpg1dqc.jpg?x-oss-process=image/resize,m_lfit,h_97,color_181b24",
                    "https://easyv.assets.dtstack.com//data/3384/1819163/img/gjrwpsp3pq_1681286516293_6a3xpg1dqc.jpg?x-oss-process=image/resize,m_lfit,h_97,color_181b24",
                  ],
                ),
                 Container(
                 margin: const EdgeInsets.symmetric(
                   horizontal: 10.0,
                       vertical: 15.0),
                  child: const HomePageMenu(
                    data: [

                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}
