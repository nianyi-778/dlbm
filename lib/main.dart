import 'package:flutter/material.dart';
import 'package:dlbm/config/router.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  Future.delayed(const Duration(seconds: 1), () {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      title: "dlbm",
      initialRoute: '/',
      debugShowCheckedModeBanner: false, // 隐藏debug标记
      onGenerateRoute: RouteConfiguration.generateRoute,
      // home: PopScope(
      //   onWillPopAttempt: () async {
      //     return await exitApp.exitApp(context);
      //   },
      //   child: Container(),
      // ),
    );
  }
}

class ExitApp {
  static DateTime? _lastPressedAt; //上次点击时间

  static Future<bool> exitApp(BuildContext context) async {
    DateTime now = DateTime.now();
    if (_lastPressedAt == null ||
        now.difference(_lastPressedAt!) > Duration(seconds: 2)) {
      //两次点击间隔超过2秒，重新计时
      _lastPressedAt = now;
      Fluttertoast.showToast(
        msg: "再按一次退出应用",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return Future.value(false);
    }
    return Future.value(true);
  }
}
