import 'package:collection/collection.dart';
import 'package:derasika2/data/model/daily_play_log.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class UpdateTypePieChartCard extends StatelessWidget {
  const UpdateTypePieChartCard({Key? key, required this.dailyPlayLogs})
      : super(key: key);

  final List<DailyPlayLog> dailyPlayLogs;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final firstPlayLogs = dailyPlayLogs
        .where((e) => e.beforeScore == 0 && e.beforeMisscount == null)
        .toList();
    final secondOrLaterPlayLogs = dailyPlayLogs
        .where((e) => e.beforeScore != 0 || e.beforeMisscount != null)
        .toList();

    final data = [
      PieChartSectionData(
        value: firstPlayLogs.length.toDouble(),
        title: '初回',
        titleStyle: themeData.textTheme.subtitle2,
        radius: 100,
        titlePositionPercentageOffset: 1.15,
        color: themeData.primaryColorDark.withAlpha(64),
      ),
      PieChartSectionData(
        value: secondOrLaterPlayLogs.length.toDouble(),
        title: 'プレイ済',
        titleStyle: themeData.textTheme.subtitle2,
        radius: 100,
        titlePositionPercentageOffset: 1.15,
        color: themeData.primaryColorDark.withAlpha(192),
      ),
    ];

    return AspectRatio(
      aspectRatio: 1.4,
      child: Card(
        child: dailyPlayLogs.isNotEmpty
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
                      children: [
                        Indicator(
                            color: themeData.primaryColorDark.withAlpha(64),
                            text: '初回 (${firstPlayLogs.length}件)',
                            isSquare: true),
                        Indicator(
                            color: themeData.primaryColorDark.withAlpha(192),
                            text: 'プレイ済 (${secondOrLaterPlayLogs.length}件)',
                            isSquare: true),
                      ]),
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
