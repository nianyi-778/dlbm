import 'package:dlbm/views/Login/index.dart';
import 'package:flutter/material.dart';
import 'package:dlbm/views/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:dlbm/views/wireguard/index.dart';
import 'package:dlbm/views/webview/index.dart';
import 'package:dlbm/views/help/index.dart';

class RouteConfiguration {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => const MainPage());
      case '/about':
        return CupertinoPageRoute(builder: (_) =>  Help());
      case '/help':
        return CupertinoPageRoute(builder: (_) => Help());
      case '/login':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LoginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset(0.0, 1.0);
            var end = Offset.zero;
            var curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      case '/vpn':
        return CupertinoPageRoute(builder: (_) => const MyWireguard());
      case '/webview':
        return CupertinoPageRoute(builder: (_) => WebViewScreen());
      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
