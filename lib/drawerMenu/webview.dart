import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HoblistPage extends StatefulWidget {
  const HoblistPage({Key? key}) : super(key: key);

  @override
  _HoblistPageState createState() => _HoblistPageState();
}

class _HoblistPageState extends State<HoblistPage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: "https://pub.dev/",
    );
  }
}
