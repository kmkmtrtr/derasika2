import 'package:derasika2/ui/pages/score_detail/children/memo_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MemoPage extends HookConsumerWidget {
  const MemoPage({Key? key, required this.chartId}) : super(key: key);

  final int chartId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final memoViewModel = ref.watch(memoViewModelProvider(chartId));
    useFuture(
        useMemoized(memoViewModel.getMemo, [memoViewModel.memo.toString()]));
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // TODO 新規追加ダイアログを開く
          memoViewModel.upsertMemo(
              null,
              DateTime.now(),
              '''Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis au''',
              'BPMメモ');
        },
      ),
      body: Scrollbar(
        controller: scrollController,
        isAlwaysShown: true,
        interactive: true,
        child: ListView.builder(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          itemCount: memoViewModel.memo.length,
          itemBuilder: (BuildContext context, int index) {
            final memo = memoViewModel.memo[index];
            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    memo.title,
                    style: textTheme.headline6,
                  ),
                  Text(
                    '${memo.createdAt}',
                    style: textTheme.subtitle1,
                  )
                ],
              ),
              subtitle: Text(memo.text, style: textTheme.bodyText1),
              onTap: () {
                memoViewModel.deleteMemo(memo.id ?? 0);
              },
            );
          },
        ),
      ),
    );
  }
}
