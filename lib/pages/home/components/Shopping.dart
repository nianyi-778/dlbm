import 'package:flutter/material.dart';

class HomePageShopping extends StatefulWidget {
  const HomePageShopping({super.key});
  @override
  _HomePageShoppingState createState() => _HomePageShoppingState();
}

class _HomePageShoppingState extends State<HomePageShopping> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const <Widget>[
            Icon(
              Icons.shopping_cart,
              color: Color.fromARGB(255, 255, 0, 0),
              size: 18,
            ),
            Text(
              "热销商品",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )
          ],
        ),
        // GridView.count(
        //   crossAxisCount: 2, // 每行显示两个子组件
        //   mainAxisSpacing: 10.0, // 主轴（垂直方向）的间距
        //   crossAxisSpacing: 10.0, // 交叉轴（水平方向）的间距
        //   children: List.generate(
        //     20,
        //     (index) => Container(
        //       color: Colors.blue,
        //       height: 100.0 + (index % 3) * 20.0, // 控制每个子组件的高度，模拟不同高度的瀑布流效果
        //     ),
        //   ),
        // )
      ],
    );
  }
}
