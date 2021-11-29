import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:derasika2/ui/pages/daily_play_log/daily_play_log_view_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlaySummaryPage extends HookConsumerWidget {
  const PlaySummaryPage({Key? key, @PathParam('date') required this.dateString})
      : super(key: key);

  final String dateString;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailyPlayLogViewModel =
        ref.watch(dailyPlayLogViewModelProvider(dateString));
    final _ = useFuture(useMemoized(dailyPlayLogViewModel.getDialyPlayLogs,
        [dailyPlayLogViewModel.dailyPlayLogs.toString()]));
    final dailyPlayLogs = dailyPlayLogViewModel.dailyPlayLogs;
    final data = dailyPlayLogs
        .groupListsBy((e) => e.level)
        .entries
        .sorted((a, b) => a.key.compareTo(b.key))
        .map(
          (e) => PieChartSectionData(
            value: e.value.length.toDouble(),
            title: e.value.length / dailyPlayLogs.length > 0.1
                ? '☆${e.key}\r\n(${e.value.length}件)'
                : '',
            radius: 100,
            titlePositionPercentageOffset: 1.2,
            color: getColor(e.key),
          ),
        )
        .toList();
    return Container(
      padding: const EdgeInsets.all(5),
      child: AspectRatio(
        aspectRatio: 1.14,
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
      ),
    );
  }

  MaterialColor getColor(int level) {
    switch (level) {
      case 1:
        return Colors.amber;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.blueGrey;
      case 4:
        return Colors.brown;
      case 5:
        return Colors.cyan;
      case 6:
        return Colors.deepOrange;
      case 7:
        return Colors.deepPurple;
      case 8:
        return Colors.green;
      case 9:
        return Colors.indigo;
      case 10:
        return Colors.lightBlue;
      case 11:
        return Colors.lightGreen;
      case 12:
        return Colors.lime;
      default:
        return Colors.grey;
    }
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
