import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WebViewPage();
}

class _WebViewPage extends State<WebViewPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool _isLoadingPage;
  @override
  void initState() {
    super.initState();
    _isLoadingPage = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments['title']),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: Get.arguments['URL'],
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) async {
              _controller.complete(webViewController);
            },
            onPageFinished: (_) {
              setState(() {
                _isLoadingPage = false;
              });
            },
          ),
          _isLoadingPage
              ? Container(
                  child: GetPlatform.isIOS
                      ? CupertinoActivityIndicator()
                      : CircularProgressIndicator(),
                  alignment: FractionalOffset.center,
                )
              : Stack(),
        ],
      ),
    );
  }
}
