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
  HomePage({Key? key}) : super(key: key);
  final _scrollController = ScrollController();
  final _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewModel = ref.watch(homeViewModelProvider);
    final snapshot = useFuture(useMemoized(homeViewModel.fetchScores, [
      homeViewModel.where,
      homeViewModel.whereArgs,
      homeViewModel.orderBy,
      homeViewModel.playMode
    ]));
    final scoreList = List<ScoreData>.from(
        homeViewModel.scores.where((e) => e.modeType == 1));
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _textFieldController,
          decoration: InputDecoration(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            suffixIcon: _textFieldController.text != ''
                ? IconButton(
                    onPressed: () {
                      _scrollController.jumpTo(0);
                      _textFieldController.clear();
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
            _scrollController.jumpTo(0);
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
                    builder: (BuildContext context) {
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
                            onPressed: () {
                              context.popRoute();
                              context
                                  .pushRoute(const CsvImportWebViewRoute())
                                  .then((result) async {
                                return;
                              });
                            },
                          )
                        ],
                      );
                    });
              }),
          IconButton(icon: const Icon(Icons.sort), onPressed: () {}),
          IconButton(icon: const Icon(Icons.filter_alt), onPressed: () {}),
        ],
        // actions: <Widget>[
        // CsvDownloadButton(model),
        // SortButton(model),
        // SearchButton(scoreDataListModel),
        // ],
      ),
      body: Center(
        child: LoadingContainer(
          isLoaded: snapshot.connectionState == ConnectionState.done,
          child: Scrollbar(
            controller: _scrollController,
            isAlwaysShown: true,
            interactive: true,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              itemCount: scoreList.length,
              itemBuilder: (BuildContext context, int index) {
                return ScoreTile(record: scoreList[index]);
              },
            ),
          ),
        ),
      ),
      drawer: HomeDrawer(),
    );
  }
}
