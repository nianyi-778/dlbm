import 'package:dlbm/pages/Login/index.dart';
import 'package:flutter/material.dart';
import 'package:dlbm/pages/index.dart';
import 'package:dlbm/pages/about/index.dart';
import 'package:flutter/cupertino.dart';

class RouteConfiguration {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => const MainPage());
      case '/about':
        return CupertinoPageRoute(builder: (_) => const About());
      case '/login':
        // return CupertinoPageRoute(builder: (_) => const LoginPage());
        return CupertinoPageRoute(
          builder: (context) => const LoginPage(),
          fullscreenDialog: true,
          transitionDuration: const Duration(milliseconds: 250),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(animation),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset.zero,
                  end: Offset(0.0, -1.0),
                ).animate(secondaryAnimation),
                child: child,
              ),
            );
          },
        );
      // case '/toolbox':
      //   return MaterialPageRoute(builder: (_) => const Toolbox());
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
