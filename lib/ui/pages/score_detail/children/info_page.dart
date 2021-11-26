import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../score_view_model.dart';

class InfoPage extends HookConsumerWidget {
  const InfoPage({Key? key, required this.chartId}) : super(key: key);

  final int chartId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final scoreViewModel = ref.read(scoreViewModelProvider(chartId));
    final chartDetail = scoreViewModel.chartDetail;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Music Info',
            style: textTheme.headline6,
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('title', style: textTheme.subtitle1),
                Text(chartDetail?.title ?? '', style: textTheme.bodyText1),
                const SizedBox(height: 10),
                Text('artist', style: textTheme.subtitle1),
                Text(chartDetail?.artist ?? '', style: textTheme.bodyText1),
                const SizedBox(height: 10),
                Text('genre', style: textTheme.subtitle1),
                Text(chartDetail?.genre ?? '', style: textTheme.bodyText1),
                const SizedBox(height: 10),
                Text('BPM', style: textTheme.subtitle1),
                Text(
                    chartDetail?.maxBpm == chartDetail?.minBpm
                        ? chartDetail?.maxBpm.toString() ?? ''
                        : '${chartDetail?.minBpm ?? ''}～${chartDetail?.maxBpm ?? ''}',
                    style: textTheme.bodyText1),
                const SizedBox(height: 10),
                Text('notes', style: textTheme.subtitle1),
                Text('${chartDetail?.notes ?? ''}', style: textTheme.bodyText1),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const Divider(),
          Text(
            'Score Info',
            style: textTheme.headline6,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('A', style: textTheme.subtitle1),
                  Text('${chartDetail?.rankA ?? ''}',
                      style: textTheme.bodyText1),
                ],
              ),
              Column(
                children: [
                  Text('AA-', style: textTheme.subtitle1),
                  Text('${chartDetail?.rankAAMinus ?? ''}',
                      style: textTheme.bodyText1),
                ],
              ),
              Column(
                children: [
                  Text('AA', style: textTheme.subtitle1),
                  Text('${chartDetail?.rankAA ?? ''}',
                      style: textTheme.bodyText1),
                ],
              ),
              Column(
                children: [
                  Text('AAA-', style: textTheme.subtitle1),
                  Text('${chartDetail?.rankAAAMinus ?? ''}',
                      style: textTheme.bodyText1),
                ],
              ),
              Column(
                children: [
                  Text('AAA', style: textTheme.subtitle1),
                  Text('${chartDetail?.rankAAA ?? ''}',
                      style: textTheme.bodyText1),
                ],
              ),
              Column(
                children: [
                  Text('MAX-', style: textTheme.subtitle1),
                  Text('${chartDetail?.maxMinus ?? ''}',
                      style: textTheme.bodyText1),
                ],
              ),
              Column(
                children: [
                  Text('MAX', style: textTheme.subtitle1),
                  Text('${chartDetail?.max ?? ''}', style: textTheme.bodyText1),
                ],
              ),
            ],
          ),
          const Divider(),
          ElevatedButton.icon(
              onPressed: () async {
                final url = chartDetail?.textageUrl;
                if (url == null) {
                  return;
                }
                if (await canLaunch(url) || Platform.isAndroid) {
                  await launch(url);
                }
              },
              icon: const Icon(Icons.open_in_browser),
              label: const Text('Textageを開く')),
          ElevatedButton.icon(
              onPressed: () async {
                final titleQuery = chartDetail?.title.replaceAll('#', '');
                final difficultyQuery = chartDetail?.difficulty;
                final url =
                    'https://www.youtube.com/results?search_query=iidx+$titleQuery+$difficultyQuery';
                if (await canLaunch(url) || Platform.isAndroid) {
                  await launch(url);
                }
              },
              icon: const Icon(Icons.open_in_browser),
              label: const Text('Youtubeで検索する')),
        ],
      ),
    );
  }
}
