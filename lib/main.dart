import 'package:flutter/material.dart';
import 'package:dlbm/config/router.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

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
    return const MaterialApp(
      title: "dlbm",
      initialRoute: '/',
      debugShowCheckedModeBanner: false, // 隐藏debug标记
      onGenerateRoute: RouteConfiguration.generateRoute,
    );
  }
}
