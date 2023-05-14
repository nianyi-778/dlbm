import 'package:flutter/material.dart';
import 'package:dlbm/config/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: RouteConfiguration.generateRoute,
    );
  }
}
