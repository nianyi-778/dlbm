import 'package:flutter/material.dart';
import 'package:dlbm/components/Avatar.dart';

class MyHeader extends StatelessWidget {
  const MyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        children: [
          Avatar(
            imageUrl:
                'https://easyv.assets.dtstack.com/account/14112/zzif77jgfd_avatar.jpeg',
            size: 70,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, top: 10),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '太阳是我呀',
                  style: TextStyle(
                      color: Color.fromRGBO(43, 43, 43, 1),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '填写个人信息更容易被别人关注哦~',
                  style: TextStyle(color: Color.fromRGBO(126, 126, 126, 1)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
