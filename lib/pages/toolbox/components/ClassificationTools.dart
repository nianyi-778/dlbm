import 'package:flutter/material.dart';

class Item {
  final String text;
  final String icon;

  Item(this.text, this.icon);
}

class ClassificationTools extends StatefulWidget {
  // final List<Item> data;

  const ClassificationTools({super.key});
  // const ClassificationTools({super.key, required this.data});
  @override
  _ClassificationToolsState createState() => _ClassificationToolsState();
}

class _ClassificationToolsState extends State<ClassificationTools> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 14, right: 14, bottom: 10, top: 6),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 6),
              width: MediaQuery.of(context).size.width,
              child: const Text(
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
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.grey[300],
                  ),
                  child: Center(
                    child: Text(
                      'Item ${index + 1}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
              itemCount: 10,
            )
          ],
        ));
  }
}
