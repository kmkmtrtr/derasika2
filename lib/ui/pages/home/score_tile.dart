import 'package:auto_route/auto_route.dart';
import 'package:derasika2/data/model/score_data.dart';
import 'package:derasika2/ui/route/app_route.dart';
import 'package:flutter/material.dart';

class ScoreTile extends StatelessWidget {
  const ScoreTile({Key? key, required this.record}) : super(key: key);

  final ScoreData record;
  static const titleRowHeight = 23.0;
  static const rowHeight = 15.8;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final difficultyColor = getDifficultyColor(record.difficulty);
    final score = record.score;
    final djLevelColor = getDjlevelColor(record.djLevel);
    final prevScore = record.prevScore ?? 0;
    final prevScoreSub = prevScore == 0
        ? ' '
        : score - prevScore >= 0
            ? '前作+${score - prevScore}'
            : '前作${score - prevScore}';
    final bestScore = record.bestScore ?? 0;
    final bestScoreSub = bestScore == 0
        ? ' '
        : score - bestScore >= 0
            ? '歴代+${score - bestScore}'
            : '歴代${score - bestScore}';
    final clearTypeColor = getClearTypeColor(record.clearType);
    final prevMisscountSub =
        record.misscount == null || record.prevMisscount == null
            ? ' '
            : record.misscount! - record.prevMisscount! >= 0
                ? '前作+${record.misscount! - record.prevMisscount!}'
                : '前作${record.misscount! - record.prevMisscount!}';
    final bestMisscountSub =
        record.misscount == null || record.bestMisscount == null
            ? ' '
            : record.misscount! - record.bestMisscount! >= 0
                ? '歴代+${record.misscount! - record.bestMisscount!}'
                : '歴代${record.misscount! - record.bestMisscount!}';
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
      children: <Widget>[
        Container(
          height: rowHeight,
          child: FittedBox(
            child: Text(
              '${record.clearType} ',
              style: TextStyle(
                color: clearTypeColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            fit: BoxFit.contain,
          ),
          alignment: Alignment.centerLeft,
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  const SizedBox(
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
                        child: Text(
                          '$score (${record.scoreRate}%) ',
                        ),
                        fit: BoxFit.contain),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: rowHeight,
                          child: FittedBox(
                              child: Text(
                                '$prevScoreSub ',
                              ),
                              fit: BoxFit.contain),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: rowHeight,
                          child: FittedBox(
                            child: Text(
                              '$bestScoreSub ',
                            ),
                            fit: BoxFit.contain,
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                    ],
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: rowHeight,
                    child: FittedBox(
                      child: Text(
                        'MISS COUNT ',
                        style: TextStyle(color: Colors.black87),
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: rowHeight,
                    child: FittedBox(
                        child: Text(
                          '${record.misscount ?? '---'} ',
                        ),
                        fit: BoxFit.contain),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            height: rowHeight,
                            child: FittedBox(
                              child: Text(
                                '$prevMisscountSub ',
                              ),
                              fit: BoxFit.contain,
                            ),
                            alignment: Alignment.centerLeft),
                      ),
                      Expanded(
                        child: Container(
                            height: rowHeight,
                            child: FittedBox(
                              child: Text(
                                '$bestMisscountSub ',
                              ),
                              fit: BoxFit.contain,
                            ),
                            alignment: Alignment.centerLeft),
                      ),
                    ],
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: rowHeight * 3,
                child: FittedBox(
                  child: Column(
                    children: <Widget>[
                      Text(
                        record.djLevel,
                        style: TextStyle(
                            fontSize: 30,
                            color: djLevelColor,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(record.scorePace),
                      Text(record.nextScorePace),
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
                  flex: (record.scoreRate * 100).round(),
                  child: Container(
                    height: 9,
                    color: Colors.lightGreen,
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
        ),
      ],
    );
    return Container(
      child: ListTile(
        leading: SizedBox(
          width: 35,
          child: FittedBox(
            child: Column(
              children: <Widget>[
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
