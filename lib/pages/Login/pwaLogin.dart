import 'package:dlbm/utils/utils.dart';
import 'package:flutter/material.dart';

class PwaLoginPage extends StatefulWidget {
  const PwaLoginPage({Key? key}) : super(key: key);

  @override
  State<PwaLoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<PwaLoginPage> {
  bool _obscureText = true;
  TextEditingController _accController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  String _userName = '';
  String _password = '';

  @override
  void initState() {
    super.initState();
    print('init login');
    setStatusBarStyle(Colors.white, Colors.black);
    _accController.addListener(_handleAccountChange);
    _pwdController.addListener(_handlePwdChange);
  }

  @override
  void dispose() {
    super.dispose();
    _accController.removeListener(_handleAccountChange);
    _pwdController.removeListener(_handlePwdChange);
    _accController.dispose();
    _pwdController.dispose();
    print('dispose login');
  }

  void _handleAccountChange() {
    setState(() {
      _userName = _accController.text;
    });
  }

  void _handlePwdChange() {
    setState(() {
      _password = _pwdController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool _isDisabled = _userName.isNotEmpty && _password.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // 返回按钮的图标
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
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '密码登录',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _accController,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(
                              50, 199, 198, 198)), // 设置未选中时的下边界线颜色
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(
                              50, 199, 198, 198)), // 设置选中时的下边界线颜色
                    ),
                    hintText: '请输入账号', // 设置提示文字
                    contentPadding: EdgeInsets.only(
                        left: 40, // 设置左内边距
                        right: 20, // 设置右内边距
                        top: 20,
                        bottom: 20),
                  ),
                ),
                TextField(
                  controller: _pwdController,
                  obscureText: _obscureText, // 设置密码输入框
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(
                              50, 199, 198, 198)), // 设置未选中时的下边界线颜色
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(
                              50, 199, 198, 198)), // 设置选中时的下边界线颜色
                    ),
                    hintText: '请输入登录密码', // 设置提示文字
                    contentPadding: const EdgeInsets.only(
                        left: 40, // 设置左内边距
                        top: 20,
                        bottom: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20, top: 5),
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '登录遇到问题',
                      style: TextStyle(fontSize: 12, color: Colors.black38),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox.fromSize(
                  size: Size(MediaQuery.of(context).size.width * 0.8,
                      45), // 设置按钮的宽度和高度
                  child: ElevatedButton(
                    onPressed: _isDisabled
                        ? () {
                            // 处理按钮点击事件
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: _isDisabled
                          ? Colors.blue
                          : Colors.black12, // 未激活时的文字颜色
                      elevation: 0.0, // 取消阴影
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // 设置按钮的圆角
                      ),
                    ),
                    child: const Text(
                      '确认登录',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
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
