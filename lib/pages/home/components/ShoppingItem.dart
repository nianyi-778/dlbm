import 'package:flutter/material.dart';

class ShoppingItem extends StatefulWidget {
  const ShoppingItem({super.key});
  @override
  _HomePageShoppingState createState() => _HomePageShoppingState();
}

class _HomePageShoppingState extends State<ShoppingItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              SizedBox(
                height: 70,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      'https://easyv.assets.dtstack.com//data/3384/1819163/img/gjrwpsp3pq_1681286516293_6a3xpg1dqc.jpg?x-oss-process=image/resize,m_lfit,h_97,color_181b24',
                      fit: BoxFit.fill,
                    )),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '券后￥',
                    style: TextStyle(
                        height: 1.0,
                        fontSize: 14,
                        color: Color.fromRGBO(250, 100, 25, 1)),
                  ),
                  Text(
                    '49',
                    style: TextStyle(
                        height: 1.0,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(250, 100, 25, 1)),
                  ),
                  Text(
                    '.90',
                    style: TextStyle(
                        height: 1.0,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color.fromRGBO(250, 100, 25, 1)),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          flex: 1,
          child: Column(
            children: const [
              Text(
                '雨伞双人加大男士雨伞上午哈哈哈哈雨伞双人加大男士雨伞上午哈哈哈哈雨伞双人加大男士雨伞上午哈哈哈哈',
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
