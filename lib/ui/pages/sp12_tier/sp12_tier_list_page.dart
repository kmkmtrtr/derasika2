import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:derasika2/data/model/enum/tier_list_mode.dart';
import 'package:derasika2/ui/pages/sp12_tier/sp12_tier_view_model.dart';
import 'package:derasika2/ui/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Sp12TierListPage extends HookConsumerWidget {
  const Sp12TierListPage({Key? key, @PathParam('mode') required this.mode})
      : super(key: key);

  final String mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final tierListMode = _getTierListEnum(mode);
    final scrollController = useScrollController();
    final sp12TierViewModel = ref.read(sp12TierViewModelProvider);
    final _ = useFuture(useMemoized(sp12TierViewModel.getTierList));
    final tierList = tierListMode == TierListMode.hard
        ? sp12TierViewModel.hardTierData.groupListsBy((e) => e.hardTierId)
        : sp12TierViewModel.clearTierData.groupListsBy((e) => e.clearTierId);
    final slivers = tierList.entries
        .map(
          (e) => SliverStickyHeader(
            header: Container(
              color: theme.primaryColor,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 30, right: 30),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tierListMode == TierListMode.hard
                        ? e.value.first.hardTierClass
                        : e.value.first.clearTierClass,
                    style: theme.textTheme.headline6
                        ?.copyWith(color: Colors.white),
                  ),
                  Text(
                    '${e.value.where((e) => e.clearTypeId > (tierListMode == TierListMode.hard ? 5 : 4)).length}/${e.value.length}',
                    style: theme.textTheme.headline6
                        ?.copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final data = e.value[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                          color: _getClearTypeColor(data.clearType), width: 20),
                      bottom: const BorderSide(color: Colors.black12),
                    ),
                  ),
                  child: ListTile(
                    title: SizedBox(
                      height: 20,
                      child: FittedBox(
                        child: Text(
                          '${data.title} [${data.difficulty}]',
                        ),
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.topLeft,
                      ),
                    ),
                    // subtitle: tierListMode == TierListMode.hard
                    //     ? Text('ハード地力: ${data.hardTierClass}')
                    //     : Text(
                    //         'クリア地力: ${data.clearTierClass}',
                    //       ),
                    onTap: () async {
                      context
                          .pushRoute(ScoreDetailRoute(chartId: data.chartId));
                    },
                  ),
                );
              }, childCount: e.value.length),
            ),
          ),
        )
        .toList();
    return Scrollbar(
      controller: scrollController,
      isAlwaysShown: true,
      interactive: true,
      child: CustomScrollView(
        slivers: slivers,
      ),
    );
  }

  TierListMode _getTierListEnum(String mode) {
    if (mode == TierListMode.hard.toString()) {
      return TierListMode.hard;
    } else if (mode == TierListMode.normal.toString()) {
      return TierListMode.normal;
    } else {
      throw Error();
    }
  }

  Color _getClearTypeColor(String s) {
    switch (s) {
      case 'NO PLAY':
        return Colors.grey.shade600;
      case 'FAILED':
        return Colors.deepOrangeAccent.shade200;
      case 'ASSIST CLEAR':
        return Colors.purpleAccent;
      case 'EASY CLEAR':
        return Colors.greenAccent.shade700;
      case 'CLEAR':
        return Colors.blueAccent;
      case 'HARD CLEAR':
        return Colors.redAccent.shade400;
      case 'EX HARD CLEAR':
        return Colors.yellow.shade700;
      case 'FULLCOMBO CLEAR':
        return Colors.cyanAccent.shade400.withRed(60);
      default:
        return Colors.black;
    }
  }
}
