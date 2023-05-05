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
      ],
    );
  }
}
