import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:collection/collection.dart';
import '../score_view_model.dart';

class ChartPage extends HookConsumerWidget {
  const ChartPage({Key? key, required this.chartId}) : super(key: key);

  final int chartId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoreViewModel = ref.watch(scoreViewModelProvider(chartId));
    final barGroups = scoreViewModel.scores.reversed
        .groupListsBy((e) => e.versionId)
        .entries
        .map(
          (e) => BarChartGroupData(
            x: e.key,
            barRods: [
              BarChartRodData(
                y: e.value.last.score.toDouble(),
                width: 25,
                borderRadius: const BorderRadius.all(Radius.zero),
                colors: e.value.last.versionId == 29
                    ? [Colors.blue]
                    : [Colors.green],
              ),
            ],
          ),
        )
        .toList();
    final versionDictionary = scoreViewModel.scores
        .groupListsBy((e) => e.versionId)
        .map((key, value) =>
            MapEntry(key, value.first.version.replaceAll(' ', '\r\n')));
    final scoreBorder = {
      scoreViewModel.chartDetail?.rankA: 'A',
      scoreViewModel.chartDetail?.rankAAMinus: 'AA-',
      scoreViewModel.chartDetail?.rankAA: 'AA',
      scoreViewModel.chartDetail?.rankAAAMinus: 'AAA-',
      scoreViewModel.chartDetail?.rankAAA: 'AAA',
      scoreViewModel.chartDetail?.maxMinus: 'Max-',
      scoreViewModel.chartDetail?.max: 'Max',
    };
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
      child: BarChart(
        BarChartData(
          titlesData: FlTitlesData(
            show: true,
            leftTitles: SideTitles(
              showTitles: true,
              interval: 1,
              reservedSize: 40,
              getTitles: (v) =>
                  '${scoreBorder[v.toInt()]}\r\n${v.toInt().toString()}',
              checkToShowTitle:
                  (minValue, maxValue, sideTitles, appliedInterval, value) =>
                      scoreBorder.containsKey(value.toInt()),
            ),
            topTitles: SideTitles(showTitles: false),
            rightTitles: SideTitles(showTitles: false),
            bottomTitles: SideTitles(
                showTitles: true,
                margin: 10,
                rotateAngle: 45,
                getTitles: (v) {
                  return versionDictionary[v.toInt()] ?? '';
                }),
          ),
          barGroups: barGroups,
          maxY: scoreViewModel.chartDetail?.max.toDouble(),
          minY: scoreViewModel.chartDetail?.rankA.toDouble(),
          gridData: FlGridData(
              show: true,
              horizontalInterval: 1,
              checkToShowHorizontalLine: (v) {
                return scoreBorder.containsKey(v.toInt());
              }),
          rangeAnnotations: RangeAnnotations(
            horizontalRangeAnnotations: [
              HorizontalRangeAnnotation(
                  y1: scoreViewModel.chartDetail?.rankA.toDouble() ?? 0,
                  y2: scoreViewModel.chartDetail?.rankAAMinus.toDouble() ?? 0,
                  color: Colors.green.shade100),
              HorizontalRangeAnnotation(
                  y1: scoreViewModel.chartDetail?.rankAAMinus.toDouble() ?? 0,
                  y2: scoreViewModel.chartDetail?.rankAA.toDouble() ?? 0,
                  color: Colors.green.shade200),
              HorizontalRangeAnnotation(
                  y1: scoreViewModel.chartDetail?.rankAA.toDouble() ?? 0,
                  y2: scoreViewModel.chartDetail?.rankAAAMinus.toDouble() ?? 0,
                  color: Colors.grey.shade200),
              HorizontalRangeAnnotation(
                  y1: scoreViewModel.chartDetail?.rankAAAMinus.toDouble() ?? 0,
                  y2: scoreViewModel.chartDetail?.rankAAA.toDouble() ?? 0,
                  color: Colors.grey.shade300),
              HorizontalRangeAnnotation(
                  y1: scoreViewModel.chartDetail?.rankAAA.toDouble() ?? 0,
                  y2: scoreViewModel.chartDetail?.maxMinus.toDouble() ?? 0,
                  color: Colors.yellow.shade100),
              HorizontalRangeAnnotation(
                y1: scoreViewModel.chartDetail?.maxMinus.toDouble() ?? 0,
                y2: scoreViewModel.chartDetail?.max.toDouble() ?? 0,
                color: Colors.yellow.shade200,
              )
            ],
          ),
        ),
      ),
    );
  }
}
