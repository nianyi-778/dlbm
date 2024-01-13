import 'package:flutter/material.dart';
import 'package:dlbm/pages/index.dart';
import 'package:dlbm/pages/about/index.dart';

class RouteConfiguration {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MainPage());
      case '/about':
        return MaterialPageRoute(builder: (_) => const About());
      // case '/shopping':
      //   return MaterialPageRoute(builder: (_) => const Shopping());
      // case '/toolbox':
      //   return MaterialPageRoute(builder: (_) => const Toolbox());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
