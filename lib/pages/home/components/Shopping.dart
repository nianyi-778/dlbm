import 'package:flutter/material.dart';
import 'package:dlbm/pages/home/components/ShoppingItem.dart';

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
        Container(
          margin: const EdgeInsets.only(top: 5, bottom: 15),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    color: Colors.white,
                    child: const ShoppingItem(),
                  ));
            },
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
