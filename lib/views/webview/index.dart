import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// webview_screen.dart
class WebViewScreen extends StatelessWidget {
  // const WebViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final webUri = ModalRoute.of(context)?.settings.arguments as WebUri?;
    final webUri = WebUri("https://apps.dtable.cloud/share/vsltJK5zYDNFTD6W6/tblyLURJh1dyxNmng/viwcMOYLCTh6mINo9") as WebUri;
    return Scaffold(
      appBar: AppBar(
        title: const Text('需求收集'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: webUri),
      )
    );
  }
}
