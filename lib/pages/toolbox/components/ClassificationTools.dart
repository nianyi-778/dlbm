import 'package:flutter/material.dart';
import 'package:dlbm/pages/toolbox/components/CardItem.dart';

class Item {
  final String title;
  final IconData icon;
  final Color bgColor;
  final String description;

  Item(
      {required this.title,
      required this.bgColor,
      required this.description,
      required this.icon});
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
        title: '抖音去水印',
        description: '无损高清原视频',
        icon: Icons.image,
        bgColor: const Color.fromRGBO(64, 149, 229, 0.84)),
    Item(
        title: 'AI换脸',
        description: '给你不一样的身份',
        icon: Icons.face_retouching_natural,
        bgColor: const Color.fromRGBO(215, 123, 21, 0.84)),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 14, right: 14, bottom: 10, top: 6),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 6),
              width: MediaQuery.of(context).size.width,
              // child: const Text(
              //   '实用工具',
              //   style: TextStyle(
              //       fontSize: 18,
              //       color: Color.fromRGBO(16, 16, 16, 1),
              //       fontWeight: FontWeight.w600,
              //       height: 1.5, // 行高是fontSize的1.5倍
              //       shadows: [
              //         Shadow(
              //             offset: Offset(0, 2.0),
              //             blurRadius: 4.0,
              //             color: Color.fromARGB(255, 32, 32, 32))
              //       ]),
              //   textAlign: TextAlign.left,
              // ),
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
                      print(person.title);
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
