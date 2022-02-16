import 'package:auto_route/auto_route.dart';
import 'package:derasika2/data/model/enum/clear_lamp.dart';
import 'package:derasika2/data/model/enum/difficulty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiver/iterables.dart';

class FilterPage extends HookConsumerWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final playState = useState(0);
    final section1 = useState(false);
    final section2 = useState(false);
    final section3 = useState(false);
    final section4 = useState(false);
    final section5 = useState(false);
    final section6 = useState(false);
    final levels =
        useState(Set<int>.from(List.generate(12, (index) => index + 1)));
    final difficulties =
        useState(Set<int>.from(List.generate(5, (index) => index + 1)));
    const djlevelItems = [
      DropdownMenuItem(child: Text('A未満'), value: 0),
      DropdownMenuItem(child: Text('A'), value: 1),
      DropdownMenuItem(child: Text('AA-'), value: 2),
      DropdownMenuItem(child: Text('AA'), value: 3),
      DropdownMenuItem(child: Text('AAA-'), value: 4),
      DropdownMenuItem(child: Text('AAA'), value: 5),
      DropdownMenuItem(child: Text('MAX-'), value: 6),
      DropdownMenuItem(child: Text('MAX'), value: 7),
    ];
    final djlevelFrom = useState(0);
    final djlevelTo = useState(7);
    final clear =
        useState(Set<int>.from(List.generate(7, (index) => index + 1)));
    final others =
        useState(Set<int>.from(List.generate(3, (index) => index + 1)));
    return Scaffold(
      appBar: AppBar(
        title: const Text('絞り込み条件'),
      ),
      body: ListView(
        children: [
          ExpansionTile(
            initiallyExpanded: false,
            onExpansionChanged: (b) => section1.value = b,
            trailing: IgnorePointer(
              child: Checkbox(
                onChanged: (b) {},
                value: section1.value,
              ),
            ),
            title: Text('プレイ状態', style: theme.textTheme.headline6),
            children: ['全ての譜面を表示する', 'プレイしたことがある譜面を表示する', '今作プレイした譜面のみ表示する']
                .asMap()
                .entries
                .map((e) => RadioListTile(
                      title: Text(e.value),
                      value: e.key,
                      groupValue: playState.value,
                      onChanged: (value) {
                        playState.value = e.key;
                      },
                    ))
                .toList(),
          ),
          ExpansionTile(
            initiallyExpanded: false,
            onExpansionChanged: (b) => section2.value = b,
            trailing: IgnorePointer(
              child: Checkbox(
                onChanged: (b) {},
                value: section2.value,
              ),
            ),
            title: Text('レベル', style: theme.textTheme.headline6),
            children: partition(List.generate(12, (i) => i + 1), 3)
                .map(
                  (e) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: e
                        .map(
                          (e) => Expanded(
                            child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text('☆$e'),
                              value: levels.value.contains(e),
                              onChanged: (v) {
                                if (v ?? false) {
                                  levels.value = levels.value.toSet()..add(e);
                                } else {
                                  levels.value = levels.value.toSet()
                                    ..remove(e);
                                }
                              },
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
          ExpansionTile(
            initiallyExpanded: false,
            onExpansionChanged: (b) => section3.value = b,
            trailing: IgnorePointer(
              child: Checkbox(
                onChanged: (b) {},
                value: section3.value,
              ),
            ),
            title: Text('難易度', style: theme.textTheme.headline6),
            children: partition(Difficulty.values, 2)
                .map(
                  (e) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: e
                        .map(
                          (e) => Expanded(
                            child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(e.name.toUpperCase()),
                              value: difficulties.value.contains(e.index + 1),
                              onChanged: (v) {
                                if (v ?? false) {
                                  difficulties.value = difficulties.value
                                      .toSet()
                                    ..add(e.index + 1);
                                } else {
                                  difficulties.value = difficulties.value
                                      .toSet()
                                    ..remove(e.index + 1);
                                }
                              },
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
          ExpansionTile(
            initiallyExpanded: false,
            onExpansionChanged: (b) => section4.value = b,
            trailing: IgnorePointer(
              child: Checkbox(
                onChanged: (b) {},
                value: section4.value,
              ),
            ),
            title: Text('スコアレート', style: theme.textTheme.headline6),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton(
                    items: djlevelItems,
                    value: djlevelFrom.value,
                    onChanged: (value) => djlevelFrom.value = value as int,
                  ),
                  const Text('～'),
                  DropdownButton(
                    items: djlevelItems,
                    value: djlevelTo.value,
                    onChanged: (value) => djlevelTo.value = value as int,
                  ),
                ],
              )
            ],
          ),
          ExpansionTile(
            initiallyExpanded: false,
            onExpansionChanged: (b) => section5.value = b,
            trailing: IgnorePointer(
              child: Checkbox(
                onChanged: (b) {},
                value: section5.value,
              ),
            ),
            title: Text('クリアランプ', style: theme.textTheme.headline6),
            children: partition(ClearLamp.values, 2)
                .map(
                  (e) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: e
                        .map(
                          (e) => Expanded(
                            child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(e.text),
                              value: clear.value.contains(e.index + 1),
                              onChanged: (v) {
                                if (v ?? false) {
                                  clear.value = clear.value.toSet()
                                    ..add(e.index + 1);
                                } else {
                                  clear.value = clear.value.toSet()
                                    ..remove(e.index + 1);
                                }
                              },
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
          ExpansionTile(
            initiallyExpanded: false,
            onExpansionChanged: (b) => section6.value = b,
            trailing: IgnorePointer(
              child: Checkbox(
                onChanged: (b) {},
                value: section6.value,
              ),
            ),
            title: Text('その他条件', style: theme.textTheme.headline6),
            children: ['過去にAAAを達成した譜面', '自己ベストが過去作よりも高い譜面', '自己ベストが過去作よりも低い譜面']
                .asMap()
                .entries
                .map(
                  (e) => CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(e.value),
                    value: others.value.contains(e.key + 1),
                    onChanged: (v) {
                      if (v ?? false) {
                        others.value = others.value.toSet()..add(e.key + 1);
                      } else {
                        others.value = others.value.toSet()..remove(e.key + 1);
                      }
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
      persistentFooterButtons: [
        OutlinedButton(
          onPressed: () {
            context.popRoute();
          },
          child: const Text('Cancel'),
        ),
        OutlinedButton(
          onPressed: () {},
          child: const Text('Reset'),
        ),
        OutlinedButton(
          onPressed: () async {
            context.popRoute();
          },
          child: const Text('Filter'),
        ),
      ],
    );
  }
}
