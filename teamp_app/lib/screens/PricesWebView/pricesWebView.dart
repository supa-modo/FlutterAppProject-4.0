import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../components/progressIndicator.dart';

class PricesWebView extends StatefulWidget {
  const PricesWebView({Key? key}) : super(key: key);

  @override
  State<PricesWebView> createState() => _PricesWebViewState();
}

class _PricesWebViewState extends State<PricesWebView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  int position = 0;
  final key = UniqueKey();

  doneLoading(String A) {
    setState(() {
      position = 0;
    });
  }

  startLoading(String A) {
    setState(() {
      position = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: IndexedStack(
        index: position,
        children: <Widget>[
          WebView(
            userAgent:
                "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.4) Gecko/20100101 Firefox/4.0",
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: 'kamis.kilimo.go.ke',
            
            onPageStarted: startLoading,
            onPageFinished: doneLoading,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
          ),
          progressIndicator()
        ],
      ),
    ));
  }
}
