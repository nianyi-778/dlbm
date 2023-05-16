import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

typedef GetIndexCallback = void Function(int index);

class CustomBottomNavigationBar extends StatefulWidget {
  int currentIndex = 0;
  final GetIndexCallback onTap;
  CustomBottomNavigationBar(
      {super.key, this.currentIndex = 0, required this.onTap});

  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: widget.currentIndex,
      onTap: (i) {
        widget.onTap(i);
      },
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: Icon(Icons.home),
          title: Text("首页"),
          selectedColor: Colors.purple,
        ),

        /// Likes
        SalomonBottomBarItem(
          icon: Icon(Icons.work),
          title: Text("百宝箱"),
          selectedColor: Colors.pink,
        ),

        /// Search
        SalomonBottomBarItem(
          icon: Icon(Icons.shopping_cart),
          title: Text("优惠券"),
          selectedColor: Colors.orange,
        ),

        /// Profile
        SalomonBottomBarItem(
          icon: Icon(Icons.person),
          title: Text("我的"),
          selectedColor: Colors.teal,
        ),
      ],
    );
  }
}
