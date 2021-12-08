import 'package:derasika2/data/model/enum/sort_element.dart';
import 'package:derasika2/data/model/enum/sort_order.dart';
import 'package:derasika2/ui/pages/home/sort/sort_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SortPage extends HookConsumerWidget {
  const SortPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(sortViewModelProvider);
    final conditionDropdownItems = [
      SortElement.title,
      SortElement.level,
      SortElement.difficulty,
      SortElement.scoreRate,
      SortElement.clearType,
      SortElement.djPoint,
      SortElement.maxBpm,
      SortElement.notes,
      SortElement.version,
      SortElement.prevScoreDiff,
      SortElement.bestScoreDiff,
      SortElement.targetScoreDiff,
    ]
        .asMap()
        .entries
        .map(
          (e) => DropdownMenuItem(
            child: Text(e.value.text),
            value: e.key,
          ),
        )
        .toList();
    final orderDropdownItems = [SortOrder.asc, SortOrder.desc]
        .asMap()
        .entries
        .map(
          (e) => DropdownMenuItem(
            child: Text(e.value.text),
            value: e.key,
          ),
        )
        .toList();
    ;

    final children = provider.sortConditions
        .asMap()
        .entries
        .map(
          (x) => Dismissible(
            key: UniqueKey(),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('並び替え条件：'),
                  DropdownButton(
                    items: conditionDropdownItems,
                    value: x.value.sortElement.index,
                    onChanged: (int? index) {
                      if (index == null) {
                        return;
                      }
                      ref
                          .read(sortViewModelProvider)
                          .changeElement(x.key, SortElement.values[index]);
                    },
                  ),
                  const Text('並び順：'),
                  DropdownButton(
                    items: orderDropdownItems,
                    value: x.value.sortOrder.index,
                    onChanged: (int? index) {
                      if (index == null) {
                        return;
                      }
                      ref
                          .read(sortViewModelProvider)
                          .changeOrder(x.key, SortOrder.values[index]);
                    },
                  ),
                ],
              ),
            ),
            onDismissed: (direction) {
              ref.read(sortViewModelProvider).removeCondition(x.key);
            },
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('並び替え条件'),
      ),
      body: ReorderableListView(
          children: children,
          onReorder: ref.read(sortViewModelProvider).reorder),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            ref.watch(sortViewModelProvider).addCondition();
          }),
      persistentFooterButtons: [
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        OutlinedButton(
          onPressed: () {
            ref.watch(sortViewModelProvider).resetConditions();
          },
          child: const Text('Reset'),
        ),
        OutlinedButton(
          onPressed: () async {
            Navigator.pop(context);
          },
          child: const Text('Sort'),
        ),
      ],
    );
  }
}
