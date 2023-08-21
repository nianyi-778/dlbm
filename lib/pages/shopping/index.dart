import 'package:flutter/material.dart';
import 'package:dlbm/pages/home/components/ShoppingItem.dart';
import 'package:flutter/services.dart';

class Shopping extends StatefulWidget {
  const Shopping({super.key});

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, //去除状态栏下的一条阴影
        title: const Text(
          '优惠券',
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.blue,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 15.0,
        ),
        width: MediaQuery.of(context).size.width,
        child: Container(
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
            itemCount: 20,
          ),
        ),
      ),
    );
  }
}
