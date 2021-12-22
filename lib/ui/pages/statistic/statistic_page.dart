import 'package:collection/collection.dart';
import 'package:derasika2/ui/pages/statistic/statistic_view_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StatisticPage extends HookConsumerWidget {
  const StatisticPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final statisticViewModel = ref.watch(statisticViewModelProvider);
    final version = useState(0);
    final level = useState(0);

    final _ = useFuture(useMemoized(statisticViewModel.loadData));
    final filteredScores = statisticViewModel.scores.where(
      (e) =>
          (e.versionId == version.value || version.value == 0) &&
          (e.level == level.value || level.value == 0),
    );

    final scoreGroup = filteredScores.groupListsBy((e) => e.djLevelId);
    final sections = scoreGroup.entries
        .sorted((a, b) => b.key.compareTo(a.key))
        .map(
          (e) => PieChartSectionData(
              value: e.value.length.toDouble(),
              title: e.value.first.djLevel,
              radius: 100,
              color: getGraphColor(e.key)),
        )
        .toList();

    final versionDropdowns = [
      const DropdownMenuItem(
        child: Text('---'),
        value: 0,
      ),
      ...statisticViewModel.versions.map(
        (e) => DropdownMenuItem(
          child: Text(e.title),
          value: e.number,
        ),
      )
    ];
    final levelDropdowns = [
      const DropdownMenuItem(
        child: Text('---'),
        value: 0,
      ),
      ...List<DropdownMenuItem<int>>.generate(
        12,
        (index) => DropdownMenuItem(
          child: Text('☆${12 - index}'),
          value: 12 - index,
        ),
      )
    ];

    final djLevels = {
      1: '---',
      2: 'F',
      3: 'E',
      4: 'D',
      5: 'C',
      6: 'B',
      7: 'A',
      8: 'AA',
      9: 'AAA',
    };
    final table = djLevels.entries
        .map(
          (x) => Row(
            children: [
              Expanded(
                  child: Center(
                      child: Text(x.value, style: theme.textTheme.headline5))),
              Expanded(
                  child: Center(
                      child: Text(scoreGroup[x.key]?.length.toString() ?? '0',
                          style: theme.textTheme.headline5))),
              Expanded(
                  child: Center(
                      child: Text(
                          '${filteredScores.isNotEmpty ? ((((scoreGroup[x.key]?.length ?? 0) / filteredScores.length) * 100).toStringAsFixed(2)) : '---'}%',
                          style: theme.textTheme.headline5)))
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        )
        .toList()
        .reversed;

    return Scaffold(
      appBar: AppBar(
        title: const Text('統計'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('バージョン'),
                DropdownButton(
                  items: versionDropdowns,
                  onChanged: (v) {
                    if (v is! int) {
                      return;
                    }
                    version.value = v;
                  },
                  value: version.value,
                ),
                const Text('レベル'),
                DropdownButton(
                  items: levelDropdowns,
                  onChanged: (v) {
                    if (v is! int) {
                      return;
                    }
                    level.value = v;
                  },
                  value: level.value,
                ),
              ],
            ),
            const Divider(),
            Card(
              child: AspectRatio(
                aspectRatio: 1.21,
                child: sections.isNotEmpty
                    ? PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(),
                          borderData: FlBorderData(show: false),
                          sectionsSpace: 1,
                          centerSpaceRadius: 60,
                          startDegreeOffset: 270,
                          sections: sections,
                        ),
                      )
                    : null,
              ),
            ),
            Card(
              child: Column(
                children: [
                  Text('DJ LEVEL', style: theme.textTheme.headline4),
                  ...table
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getGraphColor(int djlevelId) {
    switch (djlevelId) {
      case 9:
        return Colors.yellow.shade400;
      case 8:
        return Colors.grey.shade300;
      case 7:
        return Colors.green.shade300;
      case 6:
      case 5:
      case 4:
      case 3:
      case 2:
        return Colors.blue.shade400;
      default:
        return Colors.grey.shade100;
    }
  }
}
