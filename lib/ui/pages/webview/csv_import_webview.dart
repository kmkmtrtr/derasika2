import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:derasika2/ui/component/loading_container.dart';
import 'package:derasika2/ui/pages/home/home_view_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

WebViewController? _controller;

class CsvImportWebViewPage extends HookConsumerWidget {
  const CsvImportWebViewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewModel = ref.read(homeViewModelProvider);
    final snapshot = useFuture(useMemoized(homeViewModel.getCurrentVersionId));
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    return LoadingContainer(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('スコアCSVインポート'),
        ),
        body: WebView(
          initialUrl:
              'https://p.eagate.573.jp/game/2dx/${snapshot.data}/djdata/score_download.html/?style=${homeViewModel.playMode.toString().split('.').last.toUpperCase()}',
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
            final csvData = scoreData
                .replaceAll(RegExp(r'^\"|\"$'), '')
                .replaceFirst(RegExp(r'\\n$'), '')
                .replaceAll('\\"', '"');
            // if (csvData.length == 0) {
            //   Navigator.pop(context, csvData);
            //   return;
            // }
            // final csv = Csv(csvData, _mode);
            // await csv.upsert();
            context.popRoute(csvData);
          },
        ),
      ),
      isLoaded: snapshot.connectionState == ConnectionState.done,
    );
  }
}
