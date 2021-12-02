import 'package:auto_route/auto_route.dart';
import 'package:derasika2/data/model/enum/play_log_order.dart';
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
    return AutoTabsScaffold(
      appBarBuilder: (context, tabsRouter) => AppBar(
        title: Text(
          DateFormat('yyyy年MM月dd日').format(date),
        ),
        actions: tabsRouter.activeIndex == 1
            ? [
                IconButton(
                  onPressed: () async {
                    final order = await showDialog<PlayLogOrder>(
                      context: context,
                      builder: (context) => SimpleDialog(
                        title: const Text('表示順を選択してください'),
                        children: [
                          ListTile(
                            title: const Text('曲名昇順'),
                            onTap: () =>
                                context.popRoute(PlayLogOrder.songTitleAsc),
                          ),
                          ListTile(
                            title: const Text('曲名降順'),
                            onTap: () =>
                                context.popRoute(PlayLogOrder.songTitleDesc),
                          ),
                          ListTile(
                            title: const Text('レベル昇順'),
                            onTap: () =>
                                context.popRoute(PlayLogOrder.levelAsc),
                          ),
                          ListTile(
                            title: const Text('レベル降順'),
                            onTap: () =>
                                context.popRoute(PlayLogOrder.levelDesc),
                          ),
                          ListTile(
                            title: const Text('スコア昇順'),
                            onTap: () =>
                                context.popRoute(PlayLogOrder.scoreAsc),
                          ),
                          ListTile(
                            title: const Text('スコア降順'),
                            onTap: () =>
                                context.popRoute(PlayLogOrder.scoreDesc),
                          ),
                          ListTile(
                            title: const Text('スコア差分昇順'),
                            onTap: () =>
                                context.popRoute(PlayLogOrder.scoreDiffAsc),
                          ),
                          ListTile(
                            title: const Text('スコア差分降順'),
                            onTap: () =>
                                context.popRoute(PlayLogOrder.scoreDiffDesc),
                          ),
                          ListTile(
                            title: const Text('ミスカウント昇順'),
                            onTap: () =>
                                context.popRoute(PlayLogOrder.misscountAsc),
                          ),
                          ListTile(
                            title: const Text('ミスカウント降順'),
                            onTap: () =>
                                context.popRoute(PlayLogOrder.misscountDesc),
                          ),
                          ListTile(
                            title: const Text('ミスカウント差分昇順'),
                            onTap: () =>
                                context.popRoute(PlayLogOrder.misscountDiffAsc),
                          ),
                          ListTile(
                            title: const Text('ミスカウント差分降順'),
                            onTap: () => context
                                .popRoute(PlayLogOrder.misscountDiffDesc),
                          ),
                          ListTile(
                            title: const Text('クリアランプ昇順'),
                            onTap: () =>
                                context.popRoute(PlayLogOrder.clearTypeAsc),
                          ),
                          ListTile(
                            title: const Text('クリアランプ降順'),
                            onTap: () =>
                                context.popRoute(PlayLogOrder.clearTypeDesc),
                          ),
                          ListTile(
                            title: const Text('クリアランプ差分昇順'),
                            onTap: () =>
                                context.popRoute(PlayLogOrder.clearTypeDiffAsc),
                          ),
                          ListTile(
                            title: const Text('クリアランプ差分降順'),
                            onTap: () => context
                                .popRoute(PlayLogOrder.clearTypeDiffDesc),
                          ),
                        ],
                      ),
                    );
                    if (order == null) {
                      return;
                    }
                    dailyPlayLogViewModel.orderPlayLog(order);
                  },
                  icon: const Icon(Icons.sort),
                )
              ]
            : [],
      ),
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
    );
  }
}
