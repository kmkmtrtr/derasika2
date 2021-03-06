import 'package:derasika2/data/model/enum/sort_element.dart';
import 'package:derasika2/data/model/enum/sort_order.dart';
import 'package:derasika2/ui/pages/home/sort/sort_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SortPage extends HookConsumerWidget {
  const SortPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(sortViewModelProvider);
    final elements = [
      SortElement.title,
      SortElement.level,
      SortElement.difficulty,
      SortElement.scoreRate,
      SortElement.clearType,
      SortElement.djPoint,
      SortElement.notes,
      SortElement.version,
      SortElement.prevScoreDiff,
      SortElement.bestScoreDiff,
    ];
    final orders = [
      SortOrder.asc,
      SortOrder.desc,
    ];
    final conditionDropdownItems = elements
        .asMap()
        .entries
        .map(
          (e) => DropdownMenuItem(
            child: Text(e.value.text),
            value: e.key,
          ),
        )
        .toList();
    final orderDropdownItems = orders
        .asMap()
        .entries
        .map(
          (e) => DropdownMenuItem(
            child: Text(e.value.text),
            value: e.key,
          ),
        )
        .toList();

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
                    value: elements.indexOf(x.value.sortElement),
                    onChanged: (int? index) {
                      if (index == null) {
                        return;
                      }
                      ref
                          .read(sortViewModelProvider)
                          .changeElement(x.key, elements[index]);
                    },
                  ),
                  const Text('並び順：'),
                  DropdownButton(
                    items: orderDropdownItems,
                    value: orders.indexOf(x.value.sortOrder),
                    onChanged: (int? index) {
                      if (index == null) {
                        return;
                      }
                      ref
                          .read(sortViewModelProvider)
                          .changeOrder(x.key, orders[index]);
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
            ref.read(sortViewModelProvider).addCondition();
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
            ref.read(sortViewModelProvider).resetConditions();
          },
          child: const Text('Reset'),
        ),
        OutlinedButton(
          onPressed: () async {
            final sortViewModel = ref.read(sortViewModelProvider);
            sortViewModel.save();
            Navigator.pop(context, sortViewModel.sortConditions);
          },
          child: const Text('Sort'),
        ),
      ],
    );
  }
}
