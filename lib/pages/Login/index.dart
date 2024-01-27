import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    print('init login');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: 1,
            heightFactor: .5,
            child: Container(
              decoration: BoxDecoration(
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
                decoration: BoxDecoration(
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
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
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
                    Text(
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
          Container(
            padding: EdgeInsets.only(top: 20, right: 10),
            // margin: EdgeInsets.only(), // 设置外边距
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.clear,
                    size: 24,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    // 回退
                  },
                ),
                TextButton(
                  onPressed: () {
                    // 在此处添加点击事件的处理逻辑
                    print('TextButton 被点击了！');
                  },
                  child: Text(
                    '帮助与设置',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                )
              ],
            ),
          ),
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
                          SizedBox(width: 8),
                          Text(
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
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '使用手机号登录',
                    style: TextStyle(fontSize: 14),
                  ),
                  Icon(
                    Icons.chevron_right,
                    size: 16,
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
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
              SizedBox(
                height: 20,
              ),
            ],
          )),
        ],
      ),
    );
  }
}
