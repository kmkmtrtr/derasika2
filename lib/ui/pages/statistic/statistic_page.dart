import 'package:derasika2/ui/pages/statistic/statistic_view_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StatisticPage extends HookConsumerWidget {
  const StatisticPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statisticViewModel = ref.watch(statisticViewModelProvider);
    final version = useState(0);
    final level = useState(0);

    final snapshot = useFuture(useMemoized(statisticViewModel.loadData));
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
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(),
                    borderData: FlBorderData(show: false),
                    sectionsSpace: 1,
                    centerSpaceRadius: 0,
                    startDegreeOffset: 270,
                    sections: [
                      PieChartSectionData(
                        value: 4,
                        title: 'MAX-',
                        radius: 150,
                        titlePositionPercentageOffset: 1.15,
                        color: Colors.yellow.shade400,
                      ),
                      PieChartSectionData(
                        value: 196,
                        title: 'AAA',
                        radius: 140,
                        titlePositionPercentageOffset: 1.15,
                        color: Colors.yellow.shade600,
                      ),
                      PieChartSectionData(
                        value: 104,
                        title: 'AA+',
                        radius: 130,
                        titlePositionPercentageOffset: 1.15,
                        color: Colors.grey.shade300,
                      ),
                      PieChartSectionData(
                        value: 94,
                        title: 'AA',
                        radius: 120,
                        titlePositionPercentageOffset: 1.15,
                        color: Colors.grey.shade400,
                      ),
                      PieChartSectionData(
                        value: 4,
                        title: 'A+',
                        radius: 110,
                        titlePositionPercentageOffset: 1.15,
                        color: Colors.green.shade300,
                      ),
                      PieChartSectionData(
                        value: 4,
                        title: 'A',
                        radius: 100,
                        titlePositionPercentageOffset: 1.15,
                        color: Colors.green.shade400,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
