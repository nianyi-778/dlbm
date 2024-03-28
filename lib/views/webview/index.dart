import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// webview_screen.dart
class WebViewScreen extends StatelessWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final webUri = ModalRoute.of(context)?.settings.arguments as WebUri?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView'),
      ),
      body: webUri != null
          ? InAppWebView(
              initialUrlRequest: URLRequest(url: webUri),
            )
          : const Center(
              child: Text('No URL provided'),
            ),
    );
  }
}
