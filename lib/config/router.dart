import 'package:flutter/material.dart';
import 'package:dlbm/pages/home/index.dart';

class RouteConfiguration {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      // case '/second':
      //   return MaterialPageRoute(builder: (_) => SecondPage());
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