import 'package:flutter/material.dart';
import 'package:dlbm/views/toolbox/components/ClassificationTools.dart';

String removeFirstWord(String text) {
  // 将字符串按空格分割为单词列表
  final words = text.split('');
  // 移除列表的第一个单词
  words.removeAt(0);
  // 使用单词列表重新构造字符串
  final newText = words.join('');
  // 返回新字符串
  return newText;
}

String capitalizeFirstWord(String text) {
  // 将字符串按空格分割为单词列表
  final words = text.split('');
  // 获取第一个单词并将其转换为大写
  final firstWord = words[0].toUpperCase();
  // 返回第一个单词
  return firstWord;
}

class CardItem extends StatelessWidget {
  final Item data;
  // final VoidCallback onPressed;

  // const CardItem({this.index, this.onPressed});
  const CardItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 6, 10, 16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(1, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(6),
          color: data.bgColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 16.0, color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(
                        text: capitalizeFirstWord(data.title), // 第一个字母
                        style: const TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: removeFirstWord(data.title),
                      ),
                    ],
                  ),
                ),
                Text(
                  data.description,
                  style: const TextStyle(
                      fontSize: 12, color: Color.fromRGBO(255, 255, 255, 0.7)),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Icon(
                data.icon,
                color: Colors.white, // const Color.fromARGB(255, 199, 199, 199)
              ),
            ),
          ],
        ));
  }
}
