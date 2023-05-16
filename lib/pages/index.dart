import 'package:flutter/material.dart';
import 'package:dlbm/components/CustomBottomNavigationBar.dart';

import 'package:dlbm/pages/home/index.dart';
import 'package:dlbm/pages/my/index.dart';
import 'package:dlbm/pages/shopping/index.dart';
import 'package:dlbm/pages/toolbox/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  onTap(index) {
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          CustomBottomNavigationBar(onTap: onTap, currentIndex: currentIndex),
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomePage(),
          Shopping(),
          Toolbox(),
          MyApp(),
        ],
      ),
    );
  }
}
