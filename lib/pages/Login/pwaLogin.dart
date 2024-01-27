import 'package:dlbm/utils/utils.dart';
import 'package:flutter/material.dart';

class PwaLoginPage extends StatefulWidget {
  const PwaLoginPage({Key? key}) : super(key: key);

  @override
  State<PwaLoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<PwaLoginPage> {
  @override
  void initState() {
    super.initState();
    print('init login');
    setStatusBarStyle(Colors.white, Colors.black);
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // 返回按钮的图标
          onPressed: () {
            // 返回按钮的点击事件
            Navigator.pop(context);
          },
        ),
        title: null, // 设置为null，不显示标题
      ),
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                      '密码登录',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '我已详细阅读并同意',
                    style: TextStyle(fontSize: 12, color: Colors.black45),
                  ),
                  Text(
                    '《用户协议》',
                    style: TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                  Text(
                    '《隐私协议》',
                    style: TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),

      // Stack(
      //   children: [
      //     Center(
      //         child: Column(
      //       mainAxisAlignment: MainAxisAlignment.end,
      //       children: [
      //         LayoutBuilder(
      //           builder: (BuildContext context, BoxConstraints constraints) {
      //             double maxWidth = constraints.maxWidth;
      //             double buttonWidth = maxWidth * 0.8;

      //             return Container(
      //               width: buttonWidth,
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(4),
      //               ),
      //               child: ElevatedButton(
      //                 style: ButtonStyle(
      //                   shape:
      //                       MaterialStateProperty.all<RoundedRectangleBorder>(
      //                     RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(4),
      //                     ),
      //                   ),
      //                   backgroundColor:
      //                       MaterialStateProperty.all<Color>(Colors.green),
      //                   padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      //                     EdgeInsets.zero,
      //                   ),
      //                 ),
      //                 onPressed: () {
      //                   // 点击按钮时的处理逻辑
      //                 },
      //                 child: Row(
      //                   mainAxisSize: MainAxisSize.min,
      //                   children: [
      //                     Image.network(
      //                       'https://img.icons8.com/external-tal-revivo-bold-tal-revivo/48/FFFFFF/external-wechat-a-chinese-multi-purpose-messaging-social-media-and-mobile-payment-app-logo-bold-tal-revivo.png',
      //                       width: 24, // 设置图像的宽度
      //                       height: 24, // 设置图像的高度
      //                       color: Colors.white, // 设置图像的颜色
      //                     ),
      //                     SizedBox(width: 8),
      //                     Text(
      //                       '微信登录',
      //                       style: TextStyle(
      //                         color: Colors.white,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             );
      //           },
      //         ),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Text(
      //               '使用手机号登录',
      //               style: TextStyle(fontSize: 14),
      //             ),
      //             Icon(
      //               Icons.chevron_right,
      //               size: 16,
      //             ),
      //           ],
      //         ),
      //         SizedBox(
      //           height: 50,
      //         ),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Text(
      //               '我已详细阅读并同意',
      //               style: TextStyle(fontSize: 12, color: Colors.black45),
      //             ),
      //             Text(
      //               '《用户协议》',
      //               style: TextStyle(fontSize: 12, color: Colors.blue),
      //             ),
      //             Text(
      //               '《隐私协议》',
      //               style: TextStyle(fontSize: 12, color: Colors.blue),
      //             ),
      //           ],
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //       ],
      //     )),
      //   ],
      // ),
    );
  }
}
