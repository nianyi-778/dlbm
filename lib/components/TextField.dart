import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 移除焦点
        _focusNode.unfocus();
      },
      child: AbsorbPointer(
        absorbing: _focusNode.hasFocus,
        child: TextField(
          focusNode: _focusNode,
          style: const TextStyle(fontSize: 16.0),
          textAlign: TextAlign.left,
          onChanged: (value) {
            print(value.trim());
            // 处理文本框改变事件
          },
          decoration: InputDecoration(
            hintText: '搜索',
            border: InputBorder.none,
            fillColor: Colors.grey[200],
            prefixIcon: const Icon(Icons.search),
          ),
        )
      ),
    );
  }
}