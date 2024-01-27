import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void setStatusBarStyle(Color backgroundColor, Color fontColor) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: backgroundColor, // 设置状态栏的背景颜色
      statusBarIconBrightness: fontColor.computeLuminance() > 0.5
          ? Brightness.dark
          : Brightness.light, // 设置状态栏的字体颜色
    ),
  );
}
