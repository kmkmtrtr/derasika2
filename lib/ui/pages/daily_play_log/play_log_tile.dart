import 'package:auto_route/auto_route.dart';
import 'package:derasika2/data/model/daily_play_log.dart';
import 'package:derasika2/ui/route/app_route.dart';
import 'package:flutter/material.dart';

class PlayLogTile extends StatelessWidget {
  const PlayLogTile({Key? key, required this.record}) : super(key: key);

  final DailyPlayLog record;
  static const titleRowHeight = 23.0;
  static const titleFontSize = 32.0;
  static const rowHeight = 15.8;
  static const fontSize = 20.0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final difficultyColor = getDifficultyColor(record.difficulty);
    final scoreUpdated = (record.score - record.beforeScore) > 0;
    final misscountUpdated =
        ((record.beforeMisscount ?? 0) - (record.misscount ?? 0)) > 0;
    final djLevelUpdated =
        record.djlevelTypeId - record.beforeDjlevelTypeId > 0;
    final clearUpdated = record.clearTypeId - record.beforeClearTypeId > 0;

    final titleRow = SizedBox(
      height: titleRowHeight,
      child: FittedBox(
        child: Text(
          '${record.title}　',
        ),
        fit: BoxFit.contain,
        alignment: Alignment.topLeft,
      ),
    );
    final subTitleRow = Column(
      children: [
        Container(
          height: rowHeight,
          child: FittedBox(
            child: clearUpdated
                ? Row(
                    children: [
                      Text(
                        '${record.beforeClearType} ',
                        style: TextStyle(
                          color: getClearTypeColor(record.beforeClearType),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(' -> '),
                      Text(
                        '${record.clearType} ',
                        style: TextStyle(
                          color: getClearTypeColor(record.clearType),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                : Text(
                    '${record.clearType} ',
                    style: TextStyle(
                      color: getClearTypeColor(record.clearType),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
            fit: BoxFit.contain,
          ),
          alignment: Alignment.centerLeft,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: const [
                  SizedBox(
                    height: rowHeight,
                    child: FittedBox(
                      child: Text('EX SCORE ',
                          style: TextStyle(color: Colors.black87)),
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: rowHeight,
                    child: FittedBox(
                      child: Text('MISS COUNT ',
                          style: TextStyle(color: Colors.black87)),
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: rowHeight,
                    child: FittedBox(
                        child: scoreUpdated
                            ? Text(
                                '${record.score} (+${record.score - record.beforeScore})')
                            : Text(
                                '${record.score} ',
                              ),
                        fit: BoxFit.contain),
                  ),
                  SizedBox(
                    height: rowHeight,
                    child: FittedBox(
                        child: misscountUpdated
                            ? Text(
                                '${record.misscount ?? '---'} (${(record.misscount ?? 0) - (record.beforeMisscount ?? 0)}) ',
                              )
                            : Text(
                                '${record.misscount ?? '---'} ',
                              ),
                        fit: BoxFit.contain),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            Expanded(
              child: SizedBox(
                height: rowHeight * 3,
                child: FittedBox(
                  child: Column(
                    children: djLevelUpdated && record.beforeDjlevelTypeId > 1
                        ? [
                            Row(
                              children: [
                                Text(
                                  record.beforeDjlevelType,
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: getDjlevelColor(
                                          record.beforeDjlevelType),
                                      fontWeight: FontWeight.w700),
                                ),
                                const Text(
                                  ' → ',
                                ),
                                Text(
                                  record.djlevelType,
                                  style: TextStyle(
                                      fontSize: 30,
                                      color:
                                          getDjlevelColor(record.djlevelType),
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            Text(
                                '${record.beforeScoreRate.toStringAsFixed(2)}% → ${record.scoreRate.toStringAsFixed(2)}%'),
                          ]
                        : [
                            Text(
                              record.djlevelType,
                              style: TextStyle(
                                  fontSize: 30,
                                  color: getDjlevelColor(record.djlevelType),
                                  fontWeight: FontWeight.w700),
                            ),
                            scoreUpdated && record.beforeScore != 0
                                ? Text(
                                    '${record.beforeScoreRate.toStringAsFixed(2)}% → ${record.scoreRate.toStringAsFixed(2)}%')
                                : Text(
                                    '${record.scoreRate.toStringAsFixed(2)}%'),
                          ],
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: (record.beforeScoreRate * 100).round(),
                  child: Container(
                    height: 9,
                    color: Colors.lightGreen,
                  ),
                ),
                Expanded(
                  flex: (record.scoreRate * 100).round() -
                      (record.beforeScoreRate * 100).round(),
                  child: Container(
                    height: 9,
                    color: Colors.lightBlue,
                  ),
                ),
                Expanded(
                  flex: (10000 - (record.scoreRate * 100).round()),
                  child: Container(
                    height: 9,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: (66.66 * 100).round(),
                  child: Container(
                    height: 9,
                  ),
                ),
                Expanded(
                  flex: (11.11 * 100).round(),
                  child: Container(
                    height: 9,
                    decoration: const BoxDecoration(
                        border:
                            Border(left: BorderSide(color: Colors.white70))),
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        'A',
                        style: textTheme.overline?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: (11.11 * 100).round(),
                  child: Container(
                    height: 9,
                    decoration: const BoxDecoration(
                        border:
                            Border(left: BorderSide(color: Colors.white70))),
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        'AA',
                        style: textTheme.overline?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: (11.11 * 100).round(),
                  child: Container(
                    height: 9,
                    decoration: const BoxDecoration(
                        border:
                            Border(left: BorderSide(color: Colors.white70))),
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        'AAA',
                        style: textTheme.overline?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
    return Container(
      child: ListTile(
        leading: SizedBox(
          width: 35,
          child: FittedBox(
            child: Column(
              children: [
                Text(
                  record.level.toString(),
                  style: TextStyle(fontSize: 30, color: difficultyColor),
                ),
                Text(
                  '[${record.difficulty.substring(0, 1)}]',
                  style: TextStyle(fontSize: 20, color: difficultyColor),
                ),
              ],
            ),
          ),
        ),
        title: titleRow,
        subtitle: subTitleRow,
        onTap: () =>
            context.pushRoute(ScoreDetailRoute(chartId: record.chartId)),
      ),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12))),
    );
  }

  Color getDifficultyColor(String s) {
    switch (s) {
      case 'BEGINNER':
        return Colors.green;
      case 'NORMAL':
        return Colors.blue;
      case 'HYPER':
        return Colors.amber;
      case 'ANOTHER':
        return Colors.red;
      case 'LEGGENDARIA':
        return Colors.purple;
      default:
        return Colors.black;
    }
  }

  Color getDjlevelColor(String s) {
    switch (s) {
      case 'F':
      case 'E':
      case 'D':
      case 'C':
      case 'B':
        return Colors.blue.shade400;
      case 'A':
        return Colors.green.shade400;
      case 'AA':
        return Colors.grey.shade400;
      case 'AAA':
        return Colors.yellow.shade600;
      default:
        return Colors.black;
    }
  }

  Color getClearTypeColor(String s) {
    switch (s) {
      case 'NO PLAY':
        return Colors.grey.shade600;
      case 'FAILED':
        return Colors.deepOrangeAccent.shade200;
      case 'ASSIST CLEAR':
        return Colors.purpleAccent;
      case 'EASY CLEAR':
        return Colors.greenAccent.shade700;
      case 'CLEAR':
        return Colors.blueAccent;
      case 'HARD CLEAR':
        return Colors.redAccent.shade400;
      case 'EX HARD CLEAR':
        return Colors.yellow.shade700;
      case 'FULLCOMBO CLEAR':
        return Colors.cyanAccent.shade400.withRed(60);
      default:
        return Colors.black;
    }
  }
}
