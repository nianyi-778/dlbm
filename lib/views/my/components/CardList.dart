import 'package:dlbm/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CardList extends StatelessWidget {
  final Function() onUpdateIndex;
  const CardList({Key? key, required this.onUpdateIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void exitLogin() async {
      localStorage().then((storage) => storage.remove('token'));
      onUpdateIndex(); // back
      print('remove token');
      Navigator.pushNamed(context, '/login');
      Fluttertoast.showToast(
        msg: '退出登录',
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          const CardItem(name: '我的收藏', iconData: Icons.enhanced_encryption),
          const CardItem(name: '我的问答', iconData: Icons.hail),
          const CardItem(name: '问题反馈', iconData: Icons.connect_without_contact),
          const CardItem(
              name: '关于我的', link: "/about", iconData: Icons.emoji_people),
          CardItem(
              name: '退出登录', iconData: Icons.accessible_forward, fn: exitLogin)
        ],
      ),
    );
  }
}

//
class CardItem extends StatelessWidget {
  final String name;
  final String? link;
  final IconData? iconData;
  final Function? fn;
  const CardItem({required this.name, this.link, this.iconData, this.fn});

  void callback(context) {
    if (link != null) {
      Navigator.pushNamed(context, link!);
    } else {
      if (name.isNotEmpty) {
        ToastCenter('还未开发完毕，敬请期待');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (fn != null) {
            fn!();
          }
          callback(context);
        },
        child: SizedBox(
          height: 54,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Icon(iconData),
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
