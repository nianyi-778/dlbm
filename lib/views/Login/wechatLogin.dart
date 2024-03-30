import 'package:dlbm/utils/utils.dart';
import 'package:dlbm/views/Login/index.dart';
import 'package:flutter/material.dart';

class WechatLogin extends StatefulWidget {
  final Function(PageState) updatePageState;
  const WechatLogin({Key? key, required this.updatePageState})
      : super(key: key);

  @override
  State<WechatLogin> createState() => _LoginPageState();
}

class _LoginPageState extends State<WechatLogin> {
  @override
  void initState() {
    super.initState();
    print('init login');
    setStatusBarStyle(Colors.transparent, Colors.black);
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: 1,
            heightFactor: .5,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://pic2.zhimg.com/80/v2-5180bc5090487b0ee9a273d1de72a6dd_720w.webp',
                  ),
                  fit: BoxFit.cover,
                  alignment: FractionalOffset(0, 1), // 向上偏移50%
                ),
              ),
            ),
          ),
          FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 0.5,
            child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Color.fromRGBO(255, 255, 255, .6)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 4),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Image.asset('assets/icon/icon.png'),
                    ),
                    const Text(
                      '哆啦B梦，你的百宝箱',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, .6),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    )
                  ],
                )),
          ),
          AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: const Icon(
                  Icons.clear,
                  size: 24,
                ), // 返回按钮的图标
                onPressed: () {
                  // 返回按钮的点击事件
                  print(Navigator.canPop(context));
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  } else {
                    Navigator.pushReplacementNamed(context, '/');
                  }
                },
              ),
              title: null, // 设置为null，不显示标题
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    // 在此处添加点击事件的处理逻辑
                    Navigator.pushNamed(context, '/help');
                  },
                  child: const Text(
                    '帮助中心',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                )
              ]),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double maxWidth = constraints.maxWidth;
                  double buttonWidth = maxWidth * 0.8;

                  return Container(
                    width: buttonWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.zero,
                        ),
                      ),
                      onPressed: () {
                        // 点击按钮时的处理逻辑
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.network(
                            'https://img.icons8.com/external-tal-revivo-bold-tal-revivo/48/FFFFFF/external-wechat-a-chinese-multi-purpose-messaging-social-media-and-mobile-payment-app-logo-bold-tal-revivo.png',
                            width: 24, // 设置图像的宽度
                            height: 24, // 设置图像的高度
                            color: Colors.white, // 设置图像的颜色
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            '微信登录',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () => {widget.updatePageState(PageState.password)},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '使用密码登录',
                      style: TextStyle(fontSize: 14),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 16,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Row(
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
              const SizedBox(
                height: 20,
              ),
            ],
          )),
        ],
      ),
    );
  }
}
