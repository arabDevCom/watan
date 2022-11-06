import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../cubit/login_cubit.dart';

class SocialMediaWebView extends StatefulWidget {
  SocialMediaWebView({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  State<SocialMediaWebView> createState() => _SocialMediaWebViewState();
}

class _SocialMediaWebViewState extends State<SocialMediaWebView> {
  late WebViewController _controller;

  String useragent =
      'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            allowsInlineMediaPlayback: true,
            userAgent: useragent,
            onProgress: (index) {
              print("index");
              print(index);
              setState(() {
                isLoading = true;
              });
              if (index == 100) {
                setState(() {
                  isLoading = false;
                });
              }
            },
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (webViewController) {
              _controller = webViewController;
              webViewController.clearCache();
              final cookieManager = CookieManager();
              cookieManager.clearCookies();
              print("qqqqqqqqqqqqqqqqqqqqq");
            },
            onPageFinished: (text) async {
              final response = await _controller.runJavascriptReturningResult(
                  "document.documentElement.innerText");
              print(response);
              if (response.contains("watan-app4444")) {
                print("Finish");
                print(response.substring(1, response.length - 14));
                Navigator.pop(context);
                context.read<LoginCubit>().socialLoginSuccessfully(
                    response.substring(1, response.length - 14));
              }
            },
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
    );
  }
}
