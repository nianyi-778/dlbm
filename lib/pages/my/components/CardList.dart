import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CardList extends StatelessWidget {
  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: const [
          CardItem(name: '我的收藏'),
          CardItem(name: '我的问答'),
          CardItem(name: '问题反馈'),
          CardItem(name: '关于我的', link: "/about")
        ],
      ),
    );
  }
}

//
class CardItem extends StatelessWidget {
  final String name;
  final String? link;
  const CardItem({required this.name, this.link});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (link != null) {
            Navigator.pushNamed(context, link!);
          } else {
            Fluttertoast.showToast(
              msg: name,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
            );
          }
        },
        child: Container(
          height: 54,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      color: Colors.amber,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 10), // 设置边距为10
                        child: Text(
                          name,
                          style: const TextStyle(
                              color: Color.fromRGBO(51, 51, 51, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Color.fromRGBO(126, 126, 126, 1),
              )
            ],
          ),
        ));
  }
}
