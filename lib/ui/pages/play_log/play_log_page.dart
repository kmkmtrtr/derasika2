import 'package:auto_route/auto_route.dart';
import 'package:derasika2/ui/component/loading_container.dart';
import 'package:derasika2/ui/pages/play_log/play_log_view_model.dart';
import 'package:derasika2/ui/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class PlayLogPage extends HookConsumerWidget {
  const PlayLogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final playLogViewModel = ref.watch(playLogViewModelProvider);
    final snapshot = useFuture(useMemoized(
        playLogViewModel.getPlayLogs, [playLogViewModel.playLogs.toString()]));
    final playLogs = playLogViewModel.playLogs;
    return Scaffold(
      appBar: AppBar(
        title: const Text('更新履歴'),
      ),
      body: LoadingContainer(
        isLoaded: snapshot.connectionState == ConnectionState.done,
        child: Scrollbar(
          controller: scrollController,
          isAlwaysShown: true,
          interactive: true,
          child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            itemCount: playLogs.length,
            itemBuilder: (BuildContext context, int index) {
              final playLog = playLogs[index];
              return Container(
                child: ListTile(
                  title: Text(
                      '${playLog.version}\r\n${DateFormat('yyyy年MM月dd日').format(playLog.updatedAt)}'),
                  subtitle: Text('更新件数：${playLog.number}件'),
                  onTap: () async {
                    context.pushRoute(DailyPlayLogRoute(
                        dateString: playLog.updatedAt.toString()));
                  },
                ),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))),
              );
            },
          ),
        ),
      ),
    );
  }
}
