import 'package:flutter/material.dart';
import "package:dlbm/components/Swiper.dart";
import 'package:dlbm/components/TextField.dart';
import 'package:dlbm/pages/home/components/Menu.dart';
import 'package:dlbm/pages/home/components/Shopping.dart';
import 'package:flutter/services.dart';

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
    return Scaffold(
        appBar: AppBar(
          elevation: 0, //去除状态栏下的一条阴影
          toolbarHeight: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
        ), // 隐藏了app Bar
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Positioned(
                // banner 下面铺的底色
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 240,
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
                      margin: const EdgeInsets.symmetric(vertical: 15.0),
                      child: const HomePageMenu(
                        data: [],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      width: MediaQuery.of(context).size.width,
                      child: SizedBox(
                        height: 100.0,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              "https://easyv.assets.dtstack.com//data/3384/1819163/img/gjrwpsp3pq_1681286516293_6a3xpg1dqc.jpg?x-oss-process=image/resize,m_lfit,h_97,color_181b24",
                              fit: BoxFit.fill,
                            )),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 15.0,
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: const HomePageShopping(),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
