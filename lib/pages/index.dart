import 'package:flutter/material.dart';
import 'package:dlbm/components/CustomBottomNavigationBar.dart';

import 'package:dlbm/pages/home/index.dart';
import 'package:dlbm/pages/my/index.dart';
import 'package:dlbm/pages/shopping/index.dart';
import 'package:dlbm/pages/toolbox/index.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class ThemeNotifier extends ValueNotifier<ThemeData> {
  ThemeNotifier(ThemeData value) : super(value);
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  late ThemeNotifier _themeNotifier;

  @override
  void initState() {
    print('home mount');
    super.initState();
    _themeNotifier = ThemeNotifier(_getInitialTheme());
  }

  @override
  void dispose() {
    print('home unmount');
    super.dispose();
  }

  ThemeData _getInitialTheme() {
    // 返回初始的主题数据
    return ThemeData.light();
  }

  void _updateStatusBar() {
    bool isWhite = (currentIndex != 0);
    if (isWhite) {
      setStatusBarStyle(Colors.white, Colors.black); // 设置状态栏背景色为白色，字体颜色为黑色
    } else {
      setStatusBarStyle(Colors.blue, Colors.white); // 设置状态栏背景色为蓝色，字体颜色为白色
    }
  }

  onTap(index) {
    setState(() {
      currentIndex = index;
      _updateStatusBar(); // Update the status bar after modifying currentIndex
    });
  }

  final List<Widget> _children = const [
    HomePage(),
    Toolbox(),
    Shopping(),
    MyApp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          CustomBottomNavigationBar(onTap: onTap, currentIndex: currentIndex),
      body: IndexedStack(
        index: currentIndex,
        children: _children,
      ),
    );
  }

  void setStatusBarStyle(Color backgroundColor, Color fontColor) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: backgroundColor, // 设置状态栏的背景颜色
        statusBarIconBrightness: fontColor == Colors.white
            ? Brightness.light
            : Brightness.dark, // 设置状态栏的字体颜色
      ),
    );
  }
}
