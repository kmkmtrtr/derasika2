import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:derasika2/data/model/chart_detail.dart';
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
                // Container(
                //   margin: const EdgeInsets.all(10),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(10),
                //     boxShadow: const [
                //       BoxShadow(
                //         color: Color(0x80000000),
                //         offset: Offset(0, 4),
                //         blurRadius: 6,
                //       )
                //     ],
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: <Widget>[
                //       ClipRRect(
                //           borderRadius: const BorderRadius.only(
                //             topLeft: Radius.circular(10),
                //             bottomLeft: Radius.circular(10),
                //           ),
                //           child: Image.network(
                //             'https://picsum.photos/200',
                //             width: 100,
                //             height: 100,
                //           )),
                //       const SizedBox(
                //         width: 10,
                //       ),
                //       Column(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: const <Widget>[
                //             SizedBox(height: 10),
                //             Text(
                //               'tedukuri Card',
                //               style: TextStyle(
                //                 fontSize: 26,
                //                 fontWeight: FontWeight.bold,
                //                 color: Color(0xff333333),
                //               ),
                //             ),
                //             Text(
                //               'description',
                //               style: TextStyle(
                //                 fontSize: 18,
                //                 fontWeight: FontWeight.normal,
                //                 color: Color(0xff333333),
                //               ),
                //             ),
                //           ]),
                //     ],
                //   ),
                // ),
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x80000000),
                        offset: Offset(0, 4),
                        blurRadius: 6,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      const Text(
                        'Score Detail',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff333333),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text('Historical Score'),
                              Text(
                                scoreViewModel.scores.any((e) => true)
                                    ? scoreViewModel.scores
                                        .map((e) => e.score)
                                        .reduce(max)
                                        .toString()
                                    : '',
                                style: TextStyle(fontSize: 36),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text('Current Score'),
                              Text(
                                scoreViewModel.scores.any((e) => true)
                                    ? scoreViewModel.scores.first.score
                                        .toString()
                                    : '',
                                style: TextStyle(fontSize: 36),
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
                              Text('Historical misscount'),
                              Text(
                                scoreViewModel.scores.any((e) => true)
                                    ? scoreViewModel.scores
                                        .where((e) => e.misscount != null)
                                        .map((e) => e.misscount!)
                                        .reduce(min)
                                        .toString()
                                    : '---',
                                style: TextStyle(fontSize: 36),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text('Current misscount'),
                              Text(
                                scoreViewModel.scores.any((e) => true)
                                    ? scoreViewModel.scores.first.misscount
                                            ?.toString() ??
                                        '---'
                                    : '---',
                                style: TextStyle(fontSize: 36),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x80000000),
                        offset: Offset(0, 4),
                        blurRadius: 6,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Score Update Detail',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff333333),
                        ),
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
                      Row(
                        children: [],
                      )
                    ],
                  ),
                ),
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
