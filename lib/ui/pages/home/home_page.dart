import 'package:auto_route/auto_route.dart';
import 'package:derasika2/data/model/score_data.dart';
import 'package:derasika2/ui/component/loading_container.dart';
import 'package:derasika2/ui/pages/home/drawer/home_drawer.dart';
import 'package:derasika2/ui/pages/home/home_view_model.dart';
import 'package:derasika2/ui/pages/home/score_tile.dart';
import 'package:derasika2/ui/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final textFieldController = useTextEditingController();
    final homeViewModel = ref.watch(homeViewModelProvider);
    final snapshot = useFuture(useMemoized(homeViewModel.fetchScores, [
      homeViewModel.where,
      homeViewModel.whereArgs,
      homeViewModel.orderBy,
      homeViewModel.playMode,
      homeViewModel.importDateTime,
    ]));
    final scoreList = List<ScoreData>.from(
        homeViewModel.scores.where((e) => e.modeType == 1));
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: textFieldController,
          decoration: InputDecoration(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            suffixIcon: textFieldController.text != ''
                ? IconButton(
                    onPressed: () {
                      scrollController.jumpTo(0);
                      textFieldController.clear();
                      ref.watch(homeViewModelProvider).changeFilterQuery('');
                    },
                    icon: const Icon(Icons.clear),
                    color: Colors.white,
                  )
                : null,
            hintText: ' Search...',
            hintStyle: const TextStyle(color: Colors.white),
          ),
          style: const TextStyle(color: Colors.white),
          onChanged: (s) {
            scrollController.jumpTo(0);
            ref.watch(homeViewModelProvider).changeFilterQuery(s);
          },
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.download),
              tooltip: 'CSVダウンロード',
              onPressed: () async {
                await showDialog<void>(
                    context: context,
                    builder: (BuildContext _) {
                      return AlertDialog(
                        title: const Text('確認'),
                        content: const Text('公式サイトを開き、CSVを読み込みます。\r\nよろしいですか？'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('キャンセル'),
                            onPressed: () {
                              context.popRoute();
                            },
                          ),
                          TextButton(
                            child: const Text('はい'),
                            onPressed: () async {
                              final homeViewModel =
                                  ref.watch(homeViewModelProvider);
                              context.popRoute();
                              final result = await context.pushRoute(
                                  CsvImportWebViewRoute(
                                      playMode: homeViewModel.playMode,
                                      versionId: await homeViewModel
                                          .getCurrentVersionId()));
                              if (result is! List<String>) {
                                return;
                              }
                              await ref
                                  .read(homeViewModelProvider)
                                  .importCsv(result);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('CSVを読み込みました')));
                            },
                          )
                        ],
                      );
                    });
              }),
          IconButton(icon: const Icon(Icons.sort), onPressed: () {}),
          IconButton(icon: const Icon(Icons.filter_alt), onPressed: () {}),
        ],
      ),
      body: Listener(
        onPointerDown: (_) {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild?.unfocus();
          }
        },
        child: Center(
          child: LoadingContainer(
            isLoaded: snapshot.connectionState == ConnectionState.done,
            child: Scrollbar(
              controller: scrollController,
              isAlwaysShown: true,
              interactive: true,
              child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                itemCount: scoreList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ScoreTile(record: scoreList[index]);
                },
              ),
            ),
          ),
        ),
      ),
      drawer: HomeDrawer(),
    );
  }
}
