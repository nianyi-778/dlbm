import 'package:flutter/material.dart';

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
      child: const Column(
        children: [
          CardItem(name: '我的发布'),
          CardItem(name: '我的问答'),
          CardItem(name: '帮助与反馈')
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String name;
  const CardItem({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
