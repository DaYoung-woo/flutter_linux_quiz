import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

final homeUrl = Uri.parse('https://jocular-nougat-e60b0a.netlify.app');

class HomeScreen extends StatelessWidget {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(homeUrl);

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double? scrolledUnderElevation;

    return WillPopScope(
        onWillPop: () {
          var future = controller.canGoBack();
          future.then((canGoBack) => {
                if (canGoBack)
                  {controller.goBack()}
                else
                  {SystemNavigator.pop()}
              });
          return Future.value(false);
        },
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('리눅스 마스터 기출 문제 풀이'),
              backgroundColor: const Color.fromARGB(255, 99, 102, 240),
              scrolledUnderElevation: scrolledUnderElevation,
              titleTextStyle: const TextStyle(
                fontSize: 18,
                fontFamily: 'RobotoMono',
              ),
            ),
            body: WebViewWidget(
              controller: controller,
            ),
          ),
        ));
  }
}
