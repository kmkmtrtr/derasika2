import 'package:collection/collection.dart';
import 'package:derasika2/data/model/daily_play_log.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LevelPieChartCard extends StatelessWidget {
  const LevelPieChartCard({Key? key, required this.dailyPlayLogs})
      : super(key: key);

  final List<DailyPlayLog> dailyPlayLogs;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    getColor(int level) {
      return themeData.primaryColorDark.withAlpha(21 * level);
    }

    final data = dailyPlayLogs
        .groupListsBy((e) => e.level)
        .entries
        .sorted((a, b) => a.key.compareTo(b.key))
        .map(
          (e) => PieChartSectionData(
            value: e.value.length.toDouble(),
            title:
                e.value.length / dailyPlayLogs.length > 0.04 ? '☆${e.key}' : '',
            titleStyle: themeData.textTheme.subtitle2,
            radius: 100,
            titlePositionPercentageOffset: 1.15,
            color: getColor(e.key),
          ),
        )
        .toList();
    return AspectRatio(
      aspectRatio: 1.4,
      child: Card(
        child: data.isNotEmpty
            ? Row(
                children: [
                  Expanded(
                    child: PieChart(
                      PieChartData(
                        pieTouchData: PieTouchData(),
                        borderData: FlBorderData(show: false),
                        sectionsSpace: 0,
                        centerSpaceRadius: 0,
                        startDegreeOffset: 270,
                        sections: data,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: dailyPlayLogs
                        .groupListsBy((e) => e.level)
                        .entries
                        .sorted((a, b) => a.key.compareTo(b.key))
                        .map(
                          (e) => Indicator(
                            text: '☆${e.key} (${e.value.length}件)',
                            color: getColor(e.key),
                            isSquare: true,
                          ),
                        )
                        .toList(),
                  ),
                ],
              )
            : null,
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    Key? key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
        )
      ],
    );
  }
}
