import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final String initUrl = 'https://blog.codefactory.ai';
  WebViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CodeFactory',
        ),
        centerTitle: false,
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            onPressed: () {
              if (controller == null) {
                return;
              }
              controller!.loadUrl(initUrl);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
        ],
      ),
      body: WebView(
        initialUrl: initUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller) {
          this.controller = controller;
        },
      ),
    );
  }
}
