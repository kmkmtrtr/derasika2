import 'package:auto_route/auto_route.dart';
import 'package:derasika2/ui/pages/daily_play_log/daily_play_log_view_model.dart';
import 'package:derasika2/ui/pages/daily_play_log/play_log_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayDetailPage extends HookConsumerWidget {
  const PlayDetailPage({Key? key, @PathParam('date') required this.dateString})
      : super(key: key);

  final String dateString;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final dailyPlayLogViewModel =
        ref.watch(dailyPlayLogViewModelProvider(dateString));
    final _ = useFuture(useMemoized(dailyPlayLogViewModel.getDialyPlayLogs));
    final dailyPlayLogs = dailyPlayLogViewModel.dailyPlayLogs.toList()
      ..sort(dailyPlayLogViewModel.playLogSortCondition);
    return Scrollbar(
      controller: scrollController,
      isAlwaysShown: true,
      interactive: true,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        itemCount: dailyPlayLogs.length,
        itemBuilder: (BuildContext context, int index) {
          final playLog = dailyPlayLogs[index];
          return PlayLogTile(record: playLog);
        },
      ),
    );
  }
}
