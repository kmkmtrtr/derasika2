import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:derasika2/ui/component/loading_container.dart';
import 'package:derasika2/ui/pages/score_detail/score_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScoreDetailPage extends HookConsumerWidget {
  const ScoreDetailPage({Key? key, @PathParam('id') required this.chartId})
      : super(key: key);

  final int chartId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoreViewModel = ref.watch(scoreViewModelProvider);
    scoreViewModel.setChartId(chartId);
    final snapshot =
        useFuture(useMemoized(scoreViewModel.fetchChartDetail, [chartId]));
    final chartDetail = scoreViewModel.chartDetail;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(chartDetail?.title ?? ''),
            Text(chartDetail != null
                ? '${chartDetail.difficulty} ☆${chartDetail.level}'
                : ''),
          ],
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.table_chart), label: 'score'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'chart'),
          BottomNavigationBarItem(icon: Icon(Icons.note), label: 'memo'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'info'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: scoreViewModel.currentIndex,
        onTap: (index) => scoreViewModel.currentIndex = index,
      ),
      body: LoadingContainer(
        isLoaded: snapshot.connectionState == ConnectionState.done,
        child: [
          SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: double.infinity,
                    child: Column(
                      children: [
                        const Text(
                          'Score Detail',
                          style: TextStyle(fontSize: 24),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Text('Historical Score'),
                                Text(
                                  scoreViewModel.scores.any((e) => true)
                                      ? scoreViewModel.scores
                                          .map((e) => e.score)
                                          .reduce(max)
                                          .toString()
                                      : '',
                                  style: const TextStyle(fontSize: 36),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                const Text('Current Score'),
                                Text(
                                  scoreViewModel.scores.any((e) => true)
                                      ? scoreViewModel.scores.first.score
                                          .toString()
                                      : '',
                                  style: const TextStyle(fontSize: 36),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Text('Historical misscount'),
                                Text(
                                  scoreViewModel.scores.any((e) => true)
                                      ? scoreViewModel.scores
                                          .where((e) => e.misscount != null)
                                          .map((e) => e.misscount!)
                                          .reduce(min)
                                          .toString()
                                      : '---',
                                  style: const TextStyle(fontSize: 36),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                const Text('Current misscount'),
                                Text(
                                  scoreViewModel.scores.any((e) => true)
                                      ? scoreViewModel.scores.first.misscount
                                              ?.toString() ??
                                          '---'
                                      : '---',
                                  style: const TextStyle(fontSize: 36),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: double.infinity,
                    child: Column(
                      children: [
                        const Text(
                          'Score Update Detail',
                          style: TextStyle(fontSize: 24),
                        ),
                        FittedBox(
                          child: DataTable(
                            columnSpacing: 20,
                            columns: const [
                              DataColumn(
                                label: Text('Version'),
                              ),
                              DataColumn(
                                label: Text('Update\r\nDate'),
                              ),
                              DataColumn(
                                label: Text('Clear\r\nLamp'),
                              ),
                              DataColumn(
                                label: Text('Best\r\nScore'),
                              ),
                              DataColumn(
                                label: Text('Score\r\nPace'),
                              ),
                              DataColumn(
                                label: Text('Miss\r\nCount'),
                              ),
                            ],
                            rows: scoreViewModel.scores
                                .map(
                                  (e) => DataRow(
                                    cells: [
                                      DataCell(Text(e.version
                                          .toString()
                                          .replaceAll(' ', '\r\n'))),
                                      DataCell(Text(e.updatedAt)),
                                      DataCell(Text(e.clearType
                                          .toString()
                                          .replaceAll(' CLEAR', '\r\nCLEAR'))),
                                      DataCell(Container(
                                        child: Text(e.score.toString()),
                                        alignment: Alignment.centerRight,
                                      )),
                                      DataCell(Container(
                                        child: Text(
                                            '${e.scorePace}\r\n${e.nextScorePace}'),
                                        alignment: Alignment.center,
                                      )),
                                      DataCell(
                                        Container(
                                          child: Text(
                                              e.misscount?.toString() ?? '---'),
                                          alignment: Alignment.centerRight,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const Text('2'),
          const Text('3'),
          const Text('4'),
        ][scoreViewModel.currentIndex],
      ),
    );
  }
}
