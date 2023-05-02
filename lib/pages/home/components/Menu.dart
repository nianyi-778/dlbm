import 'package:flutter/material.dart';

class Item {
  final String text;
  final String icon;

  Item(this.text, this.icon);
}

class HomePageMenu extends StatefulWidget {
  final List<Item> data;

  const HomePageMenu({super.key, required this.data});
  @override
  _HomePageMenuState createState() => _HomePageMenuState();
}

class _HomePageMenuState extends State<HomePageMenu> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1 / 1,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      "https://easyv.assets.dtstack.com//data/3384/1819163/img/gjrwpsp3pq_1681286516293_6a3xpg1dqc.jpg?x-oss-process=image/resize,m_lfit,h_97,color_181b24",
                      fit: BoxFit.cover,
                    )),
              ),
              const Text(
                '抖音水印',
                style: TextStyle(fontSize: 14.0),
              )
            ],
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1 / 1,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      "https://easyv.assets.dtstack.com//data/3384/1819163/img/gjrwpsp3pq_1681286516293_6a3xpg1dqc.jpg?x-oss-process=image/resize,m_lfit,h_97,color_181b24",
                      fit: BoxFit.cover,
                    )),
              ),
              const Text(
                '抖音水印',
                style: TextStyle(fontSize: 14.0),
              )
            ],
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1 / 1,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      "https://easyv.assets.dtstack.com//data/3384/1819163/img/gjrwpsp3pq_1681286516293_6a3xpg1dqc.jpg?x-oss-process=image/resize,m_lfit,h_97,color_181b24",
                      fit: BoxFit.cover,
                    )),
              ),
              const Text(
                '抖音水印',
                style: TextStyle(fontSize: 14.0),
              )
            ],
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1 / 1,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      "https://easyv.assets.dtstack.com//data/3384/1819163/img/gjrwpsp3pq_1681286516293_6a3xpg1dqc.jpg?x-oss-process=image/resize,m_lfit,h_97,color_181b24",
                      fit: BoxFit.cover,
                    )),
              ),
              const Text(
                '抖音水印',
                style: TextStyle(fontSize: 14.0),
              )
            ],
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1 / 1,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      "https://easyv.assets.dtstack.com//data/3384/1819163/img/gjrwpsp3pq_1681286516293_6a3xpg1dqc.jpg?x-oss-process=image/resize,m_lfit,h_97,color_181b24",
                      fit: BoxFit.cover,
                    )),
              ),
              const Text(
                '抖音水印',
                style: TextStyle(fontSize: 14.0),
              )
            ],
          ),
        ),
      ],
    );
  }
}
