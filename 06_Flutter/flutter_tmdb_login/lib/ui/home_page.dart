import 'package:flutter/material.dart';
import 'package:flutter_tmdb_login/ui/session_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    // #docregion webview_controller
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('http://localhost')) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SessionPage(),
                ),
              );
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://www.themoviedb.org/authenticate/5dd93b08cc4cc254d62f679c3e3330288fcae9ce?redirect_to=http://localhost'));
    // #enddocregion webview_controller
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB Login'),
      ),
      body: Center(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
