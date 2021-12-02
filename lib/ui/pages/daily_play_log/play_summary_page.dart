import 'package:auto_route/auto_route.dart';
import 'package:derasika2/ui/pages/daily_play_log/daily_play_log_view_model.dart';
import 'package:derasika2/ui/pages/daily_play_log/graph/level_pie_chart_card.dart';
import 'package:derasika2/ui/pages/daily_play_log/graph/update_type_pie_chart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlaySummaryPage extends HookConsumerWidget {
  const PlaySummaryPage({Key? key, @PathParam('date') required this.dateString})
      : super(key: key);

  final String dateString;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = Theme.of(context);

    final dailyPlayLogViewModel =
        ref.watch(dailyPlayLogViewModelProvider(dateString));
    final _ = useFuture(useMemoized(dailyPlayLogViewModel.getDialyPlayLogs,
        [dailyPlayLogViewModel.dailyPlayLogs.toString()]));
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Text(
              '更新した譜面のレベル',
              style: themeData.textTheme.headline5,
            ),
            LevelPieChartCard(
                dailyPlayLogs: dailyPlayLogViewModel.dailyPlayLogs),
            Text(
              '更新した譜面のプレイ状況',
              style: themeData.textTheme.headline5,
            ),
            UpdateTypePieChartCard(
                dailyPlayLogs: dailyPlayLogViewModel.dailyPlayLogs),
          ],
        ),
      ),
    );
  }
}
