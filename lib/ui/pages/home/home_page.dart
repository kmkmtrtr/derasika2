import 'package:derasika2/data/model/score_data.dart';
import 'package:derasika2/ui/component/loading_container.dart';
import 'package:derasika2/ui/pages/home/home_view_model.dart';
import 'package:derasika2/ui/pages/home/score_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  HomePage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scrollController = ScrollController();
  final _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewModel = ref.read(homeViewModelProvider);
    final snapshot = useFuture(useMemoized(homeViewModel.fetchScores, [
      homeViewModel.version,
      homeViewModel.where,
      homeViewModel.whereArgs,
      homeViewModel.orderBy
    ]));
    final scoreList = List<ScoreData>.from(
        homeViewModel.scores.where((e) => e.modeType == 1));
    return Scaffold(
      appBar: AppBar(
        key: _scaffoldKey,
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(icon: const Icon(Icons.download), onPressed: () {}),
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
      // drawer: HomeDrawer(),
      // floatingActionButton: snapshot.connectionState == ConnectionState.done
      //     ? FloatingActionButton(
      //         onPressed: () async {
      //           ref.watch(homeViewModelProvider).changeVersion();
      //         },
      //         child: const Icon(Icons.change_circle_outlined),
      //       )
      //     : null,
    );
  }
}
