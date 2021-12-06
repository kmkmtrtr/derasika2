import 'package:auto_route/auto_route.dart';
import 'package:derasika2/data/model/enum/tier_list_mode.dart';
import 'package:derasika2/ui/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Sp12TierPage extends ConsumerWidget {
  const Sp12TierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      appBarBuilder: (context, tabsRouter) => AppBar(
        title: const Text('☆12地力表'),
      ),
      routes: [
        Sp12TierListRoute(mode: TierListMode.hard.toString()),
        Sp12TierListRoute(mode: TierListMode.normal.toString()),
      ],
      bottomNavigationBuilder: (_, tabsRouter) => BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'HARD'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'CLEAR')
        ],
        currentIndex: tabsRouter.activeIndex,
        onTap: (index) => tabsRouter.setActiveIndex(index),
      ),
    );
  }
}
