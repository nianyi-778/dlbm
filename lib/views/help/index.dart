import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('帮助中心'),
      ),
      body: Container(
        child: Center(
          child: SizedBox(
            height: 400,
            child: Column(
              children: [
                Image.network(
                  'https://i0.hdslb.com/bfs/material_up/ba06e321884e0b9fa63486a62bd833dbff9d5f87.png', // 替换为你要显示的图片的URL
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '有事微信联系',
                  style: TextStyle(fontSize: 24),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
