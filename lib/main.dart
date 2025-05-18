import 'package:flutter/material.dart';
import 'package:rapidd_tech/features/webView/webview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebViewWithProgress(),
      // home: Scaffold(
      //   body: Center(
      //     child: ElevatedButton(
      //       onPressed: () {},
      //       child: Text("Data"),
      //     ),
      //   ),
      // ),
    );
  }
}
