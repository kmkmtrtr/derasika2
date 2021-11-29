import 'package:auto_route/auto_route.dart';
import 'package:derasika2/ui/pages/daily_play_log/daily_play_log_view_model.dart';
import 'package:derasika2/ui/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class DailyPlayLogPage extends HookConsumerWidget {
  const DailyPlayLogPage(
      {Key? key, @PathParam('date') required this.dateString})
      : super(key: key);

  final String dateString;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = DateTime.parse(dateString);
    final dailyPlayLogViewModel =
        ref.watch(dailyPlayLogViewModelProvider(dateString));
    final _ = useFuture(useMemoized(dailyPlayLogViewModel.getDialyPlayLogs,
        [dailyPlayLogViewModel.dailyPlayLogs.toString()]));
    return Scaffold(
      appBar: AppBar(
        title: Text(DateFormat('yyyy年MM月dd日').format(date)),
      ),
      body: AutoTabsScaffold(
        routes: [
          PlaySummaryRoute(dateString: dateString.toString()),
          PlayDetailRoute(dateString: dateString.toString()),
        ],
        bottomNavigationBuilder: (_, tabsRouter) => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.summarize), label: '概要'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: '更新リスト')
          ],
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) => tabsRouter.setActiveIndex(index),
        ),
      ),
    );
  }
}
