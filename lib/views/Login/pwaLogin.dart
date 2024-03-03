import 'package:dlbm/services/user/user_impl.dart';
import 'package:dlbm/utils/utils.dart';
import 'package:dlbm/views/Login/index.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PwaLoginPage extends StatefulWidget {
  final Function(PageState) updatePageState;
  const PwaLoginPage({Key? key, required this.updatePageState})
      : super(key: key);

  @override
  State<PwaLoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<PwaLoginPage> {
  UserServiceImpl userServiceImpl = UserServiceImpl();
  bool _obscureText = true;
  TextEditingController _accController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  String _userName = '';
  String _password = '';
  // 创建一个 FocusNode 对象来管理焦点
  FocusNode _focusUserNode = FocusNode();
  FocusNode _focusPasswordNode = FocusNode();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    print('init pwd_login');
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

    _focusUserNode.dispose();
    _focusPasswordNode.dispose();
    print('dispose pwd_login');
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

  void _handleLogin() async {
    setState(() {
      isLoading = true;
    });
    // 处理按钮点击事件
    dynamic result = await userServiceImpl.login(_userName, _password);
    if (result == null) {
      setState(() {
        isLoading = false;
      });
      // 登录失败
      Fluttertoast.showToast(
        msg: '账号或密码错误，请检查后重试！',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    } else {
      Navigator.pop(context);
      // 登录成功
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool _isDisabled = _userName.isNotEmpty && _password.isNotEmpty;

    return GestureDetector(
        onTap: () {
          // 点击输入框之外的地方时，移除焦点
          if (_focusUserNode.hasFocus) {
            _focusUserNode.unfocus();
          }
          if (_focusPasswordNode.hasFocus) {
            _focusPasswordNode.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back), // 返回按钮的图标
              onPressed: () {
                // 返回按钮的点击事件
                widget.updatePageState(PageState.password);
              },
            ),
            title: null, // 设置为null，不显示标题
          ),
          body: Column(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 30,
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
                    enabled: !isLoading,
                    focusNode: _focusUserNode, // 设置 TextField 的焦点节点
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
                    enabled: !isLoading,
                    focusNode: _focusPasswordNode, // 设置 TextField 的焦点节点
                    controller: _pwdController,
                    obscureText: _obscureText, // 设置密码输入框
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 16,
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
                      onPressed:
                          _isDisabled || !isLoading ? _handleLogin : null,
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
                      child: isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              '确认登录',
                              style: TextStyle(color: Colors.white),
                            ),
                    ),
                  )
                ],
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
        ));
  }
}
