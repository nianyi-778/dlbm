import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

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

// localStorage
Future<SharedPreferences> localStorage() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs;
}

int getNavigationStackLength(BuildContext context) {
  NavigatorState navigatorState = Navigator.of(context);
  int stackLength = navigatorState.widget.pages.length;
  return stackLength;
}

void ToastCenter(String name) {
  if (name.isNotEmpty) {
    Fluttertoast.showToast(
      msg: name,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
    );
  }
}

void openWebPage(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw '无法打开网页：$url';
  }
}

void launchURL(String url) async {
  final Uri launch = Uri.parse(url);
  bool isInstall = await canLaunchUrl(launch);
  if (isInstall) {
    ToastCenter('正在跳转，请稍等...');
    await launchUrl(launch);
  } else {
    ToastCenter('未安装,请先下载');
  }
}