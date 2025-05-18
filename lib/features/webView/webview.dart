import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWithProgress extends StatefulWidget {
  @override
  State<WebViewWithProgress> createState() => _WebViewWithProgressState();
}

class _WebViewWithProgressState extends State<WebViewWithProgress> {
  late final WebViewController _controller;
  int _progress = 0;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() => _progress = 0);
          },
          onProgress: (progress) {
            setState(() => _progress = progress);
          },
          onPageFinished: (url) {
            setState(() => _progress = 100);
          },
        ),
      )
      ..loadRequest(Uri.parse("https://flutter.dev"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WebView with Progress")),
      body: Column(
        children: [
          if (_progress < 100)
            LinearProgressIndicator(
              value: _progress / 100,
              minHeight: 3,
              backgroundColor: Colors.grey[200],
              color: Colors.blue,
            ),
          Expanded(child: WebViewWidget(controller: _controller)),
        ],
      ),
    );
  }
}