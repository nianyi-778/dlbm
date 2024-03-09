import 'package:dlbm/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:dlbm/components/CustomBottomNavigationBar.dart';
import 'package:dlbm/services/user/user_impl.dart';
import 'package:dlbm/views/home/index.dart';
import 'package:dlbm/views/my/index.dart';
import 'package:dlbm/views/shopping/index.dart';
import 'package:dlbm/views/toolbox/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<int> currents = [0];
  UserServiceImpl userServiceImpl = UserServiceImpl();

  void onUpdateIndex(int index) {
    if (currents.last != index) {
      currents.add(index);
      List<int> lastTwo = currents.length >= 2
          ? currents.sublist(currents.length - 2)
          : currents;
      setState(() {
        currents = lastTwo;
      });
    }
  }

  @override
  void initState() {
    print('home mount');
    super.initState();
    checkToken(context);
  }

  void checkToken(context) async {
    SharedPreferences storage = await localStorage();
    String? token = storage.getString('token');
    if (token != null) {
      bool isEffective = await userServiceImpl.verify(); // 是否有效
      print('check token result ==> ${isEffective}');
      if (!isEffective) {
        storage.remove('token');
        Navigator.pushNamed(context, '/login');
      }
    }
  }

  @override
  void dispose() {
    print('home unmount');
    super.dispose();
  }

  void onTap(int index, context) async {
    SharedPreferences storage = await localStorage();
    String? token = storage.getString('token');
    if (index == 3 && token == null) {
      Navigator.pushNamed(context, '/login');
    } else {
      onUpdateIndex(index);
    }
  }

/**
 * @退出登录
 * */
  void onBackBar() {
    if (currents.last == 3 && currents.first != 3) {
      // 删除last
      setState(() {
        currents = [currents.first];
      });
    } else {
      setState(() {
        currents = [0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      const HomePage(),
      const Toolbox(),
      const Shopping(),
      MyApp(onUpdateIndex: onBackBar),
    ];
    int lastIndex = currents.last;
    // currents
    return Scaffold(
      bottomNavigationBar:
          CustomBottomNavigationBar(onTap: onTap, currentIndex: lastIndex),
      body: IndexedStack(
        index: lastIndex,
        children: _children,
      ),
    );
  }
}
