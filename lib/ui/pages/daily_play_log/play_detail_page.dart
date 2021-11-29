import 'package:auto_route/auto_route.dart';
import 'package:derasika2/ui/pages/daily_play_log/daily_play_log_view_model.dart';
import 'package:derasika2/ui/route/app_route.dart';
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
    final _ = useFuture(useMemoized(dailyPlayLogViewModel.getDialyPlayLogs,
        [dailyPlayLogViewModel.dailyPlayLogs.toString()]));
    final dailyPlayLogs = dailyPlayLogViewModel.dailyPlayLogs;
    final textTheme = Theme.of(context).textTheme;
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
          return Container(
            child: ListTile(
              title: SizedBox(
                height: 20,
                child: FittedBox(
                  child: Text(
                    '${playLog.title} [${playLog.difficulty}]',
                    style: textTheme.subtitle1,
                  ),
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.topLeft,
                ),
              ),
              subtitle: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      'クリアランプ：${playLog.clearType}　${playLog.clearTypeId == playLog.beforeClearTypeId ? '' : '(${playLog.beforeClearType})'}\r\n'
                      '　　　スコア：${playLog.score}　${playLog.score > playLog.beforeScore ? '(+${playLog.score - playLog.beforeScore})' : ''}\r\n'
                      'ミスカウント：${playLog.misscount}　${(playLog.misscount != null && playLog.beforeMisscount != null) ? '(${playLog.misscount! - playLog.beforeMisscount!})' : ''}',
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: (playLog.beforeScoreRate * 100).round(),
                        child: Container(
                          height: 4,
                          color: Colors.purple.shade100,
                        ),
                      ),
                      Expanded(
                        flex: (playLog.scoreRate * 100).round() -
                            (playLog.beforeScoreRate * 100).round(),
                        child: Container(
                          height: 4,
                          color: Colors.purpleAccent,
                        ),
                      ),
                      Expanded(
                        flex: (10000 - (playLog.scoreRate * 100).round()),
                        child: Container(
                          height: 4,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              onTap: () {
                context.pushRoute(ScoreDetailRoute(chartId: playLog.chartId));
              },
            ),
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12))),
          );
        },
      ),
    );
  }
}
