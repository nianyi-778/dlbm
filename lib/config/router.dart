import 'package:flutter/material.dart';
import 'package:dlbm/pages/home/index.dart';
import 'package:dlbm/pages/my/index.dart';
import 'package:dlbm/pages/shopping/index.dart';
import 'package:dlbm/pages/toolbox/index.dart';

class RouteConfiguration {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/my':
        return MaterialPageRoute(builder: (_) => const MyApp());
      case '/shopping':
        return MaterialPageRoute(builder: (_) => const Shopping());
      case '/toolbox':
        return MaterialPageRoute(builder: (_) => const Toolbox());
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
