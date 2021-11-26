import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../score_view_model.dart';

class ScorePage extends HookConsumerWidget {
  const ScorePage({Key? key, required this.chartId}) : super(key: key);

  final int chartId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoreViewModel = ref.read(scoreViewModelProvider(chartId));
    return SingleChildScrollView(
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
                            scoreViewModel.historicalScoreRecord?.score
                                    .toString() ??
                                '',
                            style: const TextStyle(fontSize: 36),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Current Score'),
                          Text(
                            scoreViewModel.currentRecord?.score.toString() ??
                                '',
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
                            scoreViewModel.historicalMissCountRecord?.misscount
                                    ?.toString() ??
                                '---',
                            style: const TextStyle(fontSize: 36),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Current misscount'),
                          Text(
                            scoreViewModel.currentRecord?.misscount
                                    ?.toString() ??
                                '---',
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
                                    child:
                                        Text(e.misscount?.toString() ?? '---'),
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
    );
  }
}
