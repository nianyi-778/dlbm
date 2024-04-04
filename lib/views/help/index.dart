import 'package:dlbm/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0, //去除状态栏下的一条阴影
        title: const Text(
          '关于我的',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Center(
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
              const    SizedBox(
                height: 10,
              ),
              const  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '有事微信联系，记得备注',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    ' "dlbm"',
                    style: TextStyle(fontSize: 14,color: Colors.red),
                  ),
                ],
              ),
              const   SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: ()=>{
                    FlutterClipboard.copy('nianyi778').then(  ( value ) => {
                      ToastCenter("复制成功，打开微信"),
                      launchURL('weixin://')
                    })
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  child: const Text('点击复制微信号并打开微信',style: TextStyle(color: Colors.white),))
            ],
          ),
        ),
      ),
    );
  }
}
