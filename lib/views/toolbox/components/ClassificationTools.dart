import 'dart:io';

import 'package:dlbm/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:dlbm/views/toolbox/components/CardItem.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Item {
  final String title;
  final IconData icon;
  final Color bgColor;
  final String? link;
  bool? isWebView;
  final String description;

  Item({
    required this.title,
    required this.bgColor,
    this.link,
    this.isWebView,
    required this.description,
    required this.icon,
  });
}

class ClassificationTools extends StatefulWidget {
  // final List<Item> data;

  const ClassificationTools({super.key});
  // const ClassificationTools({super.key, required this.data});
  @override
  _ClassificationToolsState createState() => _ClassificationToolsState();
}

class _ClassificationToolsState extends State<ClassificationTools> {
  List<Item> personList = [
    Item(
        title: '短视频去水印',
        description: '无损高清原视频',
        link: "http://www.jiexiapi.top/",
        isWebView: true,
        icon: Icons.image,
        bgColor: const Color.fromRGBO(64, 149, 229, 0.84)),
  ];

  @override
  Widget build(BuildContext context) {
    bool hasItemWithTitle = personList.any((item) => item.title == 'VPN');

    if (Platform.isAndroid && hasItemWithTitle == false) {
      personList.add(Item(
          title: 'VPN',
          link: '/vpn',
          description: '翻墙术、想你所想',
          icon: Icons.accessible_forward,
          bgColor: Color.fromARGB(212, 63, 160, 107)));
    }

    return Container(
        padding: const EdgeInsets.only(left: 14, right: 14, bottom: 10, top: 6),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 6),
              width: MediaQuery.of(context).size.width,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const   Text(
                    '实用工具',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(16, 16, 16, 1),
                        fontWeight: FontWeight.w600,
                        height: 1.5, // 行高是fontSize的1.5倍
                        shadows: [
                          Shadow(
                              offset: Offset(0, 2.0),
                              blurRadius: 4.0,
                              color: Color.fromARGB(255, 32, 32, 32))
                        ]),
                    textAlign: TextAlign.left,
                  ),
                  TextButton(
                    onPressed: () {
                      // 点击事件处理函数
                      Navigator.pushNamed(context,'/webview');
                    },
                    child:const Text(
                      '需求反馈',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.5,
              ),
              itemBuilder: (BuildContext context, int index) {
                final person = personList[index];
                if (person.title.isNotEmpty) {
                  return InkWell(
                    onTap: () {
                      if (person.link != null && person.link!.isNotEmpty) {
                        if (person.isWebView == true) {
                          openWebPage(Uri.parse(person.link as String));
                        } else {
                          Navigator.pushNamed(context, person.link as String);
                        }
                      }
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.grey[0],
                        ),
                        child: CardItem(data: person)),
                  );
                }
              },
              itemCount: personList.length,
            )
          ],
        ));
  }
}
