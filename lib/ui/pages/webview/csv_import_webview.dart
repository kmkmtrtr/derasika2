import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:derasika2/data/model/play_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

WebViewController? _controller;

class CsvImportWebViewPage extends StatelessWidget {
  const CsvImportWebViewPage(
      {Key? key, required this.playMode, required this.versionId})
      : super(key: key);
  final PlayMode playMode;
  final int versionId;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('スコアCSVインポート'),
      ),
      body: WebView(
        initialUrl:
            'https://p.eagate.573.jp/game/2dx/$versionId/djdata/score_download.html/?style=${playMode.toString().split('.').last.toUpperCase()}',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) => _controller = controller,
        onPageFinished: (url) async {
          if (_controller == null) {
            return;
          }
          final scoreData = await _controller!.runJavascriptReturningResult(
              'document.getElementById(\'score_data\').value');
          if (scoreData == 'null') {
            return;
          }
          // runJavascriptReturningResult で返される文字列を利用可能な形式にする
          final csvData = scoreData
              .replaceAll(RegExp(r'^\"|\"$'), '')
              .replaceAll('\\"', '"')
              .split('\\n');
          context.popRoute(csvData);
        },
      ),
    );
  }
}
