import 'package:derasika2/data/model/score_data.dart';
import 'package:derasika2/ui/component/loading_container.dart';
import 'package:derasika2/ui/pages/home/home_view_model.dart';
import 'package:derasika2/ui/pages/home/score_tile.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  HomePage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final myScrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewModel = ref.read(homeViewModelProvider);
    final snapshot = useFuture(useMemoized(homeViewModel.fetchScores));
    final scoreList = List<ScoreData>.from(
        homeViewModel.scores.where((e) => e.modeType == 1));
    return Scaffold(
      appBar: AppBar(
        key: _scaffoldKey,
        title: const Text('スコア一覧'),
        // actions: <Widget>[
        // CsvDownloadButton(model),
        // SortButton(model),
        // SearchButton(scoreDataListModel),
        // ],
      ),
      body: Center(
        child: LoadingContainer(
          isLoaded: snapshot.hasData,
          child: DraggableScrollbar.semicircle(
            controller: myScrollController,
            child: ListView.builder(
              controller: myScrollController,
              scrollDirection: Axis.vertical,
              itemCount: scoreList.length,
              itemBuilder: (BuildContext context, int index) {
                return ScoreTile(record: scoreList[index]);
              },
            ),
          ),
        ),
      ),
      // drawer: HomeDrawer(),
      floatingActionButton: snapshot.hasData
          ? FloatingActionButton(
              onPressed: () async {
                ref.watch(homeViewModelProvider).refreshScores();
              },
              child: const Icon(Icons.ac_unit),
            )
          : null,
    );
  }
}
