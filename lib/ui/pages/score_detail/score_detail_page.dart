import 'package:derasika2/ui/component/loading_container.dart';
import 'package:derasika2/ui/pages/score_detail/score_view_model.dart';
import 'package:derasika2/ui/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';

class ScoreDetailPage extends HookConsumerWidget {
  const ScoreDetailPage({Key? key, @PathParam('id') required this.chartId})
      : super(key: key);

  final int chartId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoreViewModel = ref.watch(scoreViewModelProvider(chartId));
    final snapshot =
        useFuture(useMemoized(scoreViewModel.getChartDetail, [chartId]));
    final chartDetail = scoreViewModel.chartDetail;
    final theme = Theme.of(context);
    return LoadingContainer(
      isLoaded: snapshot.connectionState == ConnectionState.done,
      child: AutoTabsScaffold(
        appBarBuilder: (context, tabsRouter) => AppBar(
          title: Column(
            children: [
              Text(chartDetail?.title ?? ''),
              Text(chartDetail != null
                  ? '${chartDetail.difficulty} ☆${chartDetail.level}'
                  : ''),
            ],
            crossAxisAlignment: CrossAxisAlignment.stretch,
          ),
        ),
        routes: [
          ScoreRoute(chartId: chartId),
          ChartRoute(chartId: chartId),
          MemoRoute(chartId: chartId),
          InfoRoute(chartId: chartId),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.table_chart), label: 'スコア'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart), label: 'グラフ'),
              BottomNavigationBarItem(icon: Icon(Icons.note), label: 'メモ'),
              BottomNavigationBarItem(icon: Icon(Icons.info), label: '情報'),
            ],
            selectedItemColor: theme.primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
          );
        },
      ),
    );
  }
}
