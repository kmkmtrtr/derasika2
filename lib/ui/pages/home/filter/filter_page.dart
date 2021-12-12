import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilterPage extends HookConsumerWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final playState = useState(0);
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
    final others = useState(Set<int>.from(List.generate(3, (index) => index)));
    return Scaffold(
      appBar: AppBar(
        title: const Text('絞り込み条件'),
      ),
      body: ListView(
        children: [
          ExpansionTile(
            initiallyExpanded: true,
            title: Text('プレイ状態', style: theme.textTheme.headline6),
            children: [
              RadioListTile(
                title: const Text('全ての譜面を表示する'),
                value: 0,
                groupValue: playState.value,
                onChanged: (value) {
                  playState.value = 0;
                },
              ),
              RadioListTile(
                title: const Text('プレイしたことがある譜面を表示する'),
                value: 1,
                groupValue: playState.value,
                onChanged: (value) {
                  playState.value = 1;
                },
              ),
              RadioListTile(
                title: const Text('今作プレイした譜面のみ表示する'),
                value: 2,
                groupValue: playState.value,
                onChanged: (value) {
                  playState.value = 2;
                },
              ),
            ],
          ),
          ExpansionTile(
            initiallyExpanded: true,
            title: Text('レベル', style: theme.textTheme.headline6),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('☆1'),
                      value: levels.value.contains(1),
                      onChanged: (v) {
                        if (v ?? false) {
                          levels.value = levels.value.toSet()..add(1);
                        } else {
                          levels.value = levels.value.toSet()..remove(1);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('☆2'),
                      value: levels.value.contains(2),
                      onChanged: (v) {
                        if (v ?? false) {
                          levels.value = levels.value.toSet()..add(2);
                        } else {
                          levels.value = levels.value.toSet()..remove(2);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('☆3'),
                      value: levels.value.contains(3),
                      onChanged: (v) {
                        if (v ?? false) {
                          levels.value = levels.value.toSet()..add(3);
                        } else {
                          levels.value = levels.value.toSet()..remove(3);
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('☆4'),
                      value: levels.value.contains(4),
                      onChanged: (v) {
                        if (v ?? false) {
                          levels.value = levels.value.toSet()..add(4);
                        } else {
                          levels.value = levels.value.toSet()..remove(4);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('☆5'),
                      value: levels.value.contains(5),
                      onChanged: (v) {
                        if (v ?? false) {
                          levels.value = levels.value.toSet()..add(5);
                        } else {
                          levels.value = levels.value.toSet()..remove(5);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('☆6'),
                      value: levels.value.contains(6),
                      onChanged: (v) {
                        if (v ?? false) {
                          levels.value = levels.value.toSet()..add(6);
                        } else {
                          levels.value = levels.value.toSet()..remove(6);
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('☆7'),
                      value: levels.value.contains(7),
                      onChanged: (v) {
                        if (v ?? false) {
                          levels.value = levels.value.toSet()..add(7);
                        } else {
                          levels.value = levels.value.toSet()..remove(7);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('☆8'),
                      value: levels.value.contains(8),
                      onChanged: (v) {
                        if (v ?? false) {
                          levels.value = levels.value.toSet()..add(8);
                        } else {
                          levels.value = levels.value.toSet()..remove(8);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('☆9'),
                      value: levels.value.contains(9),
                      onChanged: (v) {
                        if (v ?? false) {
                          levels.value = levels.value.toSet()..add(9);
                        } else {
                          levels.value = levels.value.toSet()..remove(9);
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('☆10'),
                      value: levels.value.contains(10),
                      onChanged: (v) {
                        if (v ?? false) {
                          levels.value = levels.value.toSet()..add(10);
                        } else {
                          levels.value = levels.value.toSet()..remove(10);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('☆11'),
                      value: levels.value.contains(11),
                      onChanged: (v) {
                        if (v ?? false) {
                          levels.value = levels.value.toSet()..add(11);
                        } else {
                          levels.value = levels.value.toSet()..remove(11);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('☆12'),
                      value: levels.value.contains(12),
                      onChanged: (v) {
                        if (v ?? false) {
                          levels.value = levels.value.toSet()..add(12);
                        } else {
                          levels.value = levels.value.toSet()..remove(12);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          ExpansionTile(
            initiallyExpanded: true,
            title: Text('難易度', style: theme.textTheme.headline6),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('BEGINNER'),
                      value: difficulties.value.contains(1),
                      onChanged: (v) {
                        if (v ?? false) {
                          difficulties.value = difficulties.value.toSet()
                            ..add(1);
                        } else {
                          difficulties.value = difficulties.value.toSet()
                            ..remove(1);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('NORMAL'),
                      value: difficulties.value.contains(2),
                      onChanged: (v) {
                        if (v ?? false) {
                          difficulties.value = difficulties.value.toSet()
                            ..add(2);
                        } else {
                          difficulties.value = difficulties.value.toSet()
                            ..remove(2);
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('HYPER'),
                      value: difficulties.value.contains(3),
                      onChanged: (v) {
                        if (v ?? false) {
                          difficulties.value = difficulties.value.toSet()
                            ..add(3);
                        } else {
                          difficulties.value = difficulties.value.toSet()
                            ..remove(3);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('ANOTHER'),
                      value: difficulties.value.contains(4),
                      onChanged: (v) {
                        if (v ?? false) {
                          difficulties.value = difficulties.value.toSet()
                            ..add(4);
                        } else {
                          difficulties.value = difficulties.value.toSet()
                            ..remove(4);
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('LEGGENDARIA'),
                      value: difficulties.value.contains(5),
                      onChanged: (v) {
                        if (v ?? false) {
                          difficulties.value = difficulties.value.toSet()
                            ..add(5);
                        } else {
                          difficulties.value = difficulties.value.toSet()
                            ..remove(5);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  )
                ],
              ),
            ],
          ),
          ExpansionTile(
            initiallyExpanded: true,
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
            initiallyExpanded: true,
            title: Text('クリアランプ', style: theme.textTheme.headline6),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('NO PLAY'),
                      value: clear.value.contains(1),
                      onChanged: (v) {
                        if (v ?? false) {
                          clear.value = clear.value.toSet()..add(1);
                        } else {
                          clear.value = clear.value.toSet()..remove(1);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('ASSIST EASY'),
                      value: clear.value.contains(2),
                      onChanged: (v) {
                        if (v ?? false) {
                          clear.value = clear.value.toSet()..add(2);
                        } else {
                          clear.value = clear.value.toSet()..remove(2);
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('EASY CLEAR'),
                      value: clear.value.contains(3),
                      onChanged: (v) {
                        if (v ?? false) {
                          clear.value = clear.value.toSet()..add(3);
                        } else {
                          clear.value = clear.value.toSet()..remove(3);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('CLEAR'),
                      value: clear.value.contains(4),
                      onChanged: (v) {
                        if (v ?? false) {
                          clear.value = clear.value.toSet()..add(4);
                        } else {
                          clear.value = clear.value.toSet()..remove(4);
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('HARD CLEAR'),
                      value: clear.value.contains(5),
                      onChanged: (v) {
                        if (v ?? false) {
                          clear.value = clear.value.toSet()..add(5);
                        } else {
                          clear.value = clear.value.toSet()..remove(5);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('EX HARD CLEAR'),
                      value: clear.value.contains(6),
                      onChanged: (v) {
                        if (v ?? false) {
                          clear.value = clear.value.toSet()..add(6);
                        } else {
                          clear.value = clear.value.toSet()..remove(6);
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('FULLCOMBO'),
                      value: clear.value.contains(7),
                      onChanged: (v) {
                        if (v ?? false) {
                          clear.value = clear.value.toSet()..add(7);
                        } else {
                          clear.value = clear.value.toSet()..remove(7);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ],
          ),
          ExpansionTile(
            initiallyExpanded: true,
            title: Text('その他条件', style: theme.textTheme.headline6),
            children: [
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('過去にAAAを達成した譜面'),
                value: others.value.contains(0),
                onChanged: (v) {
                  if (v ?? false) {
                    others.value = others.value.toSet()..add(0);
                  } else {
                    others.value = others.value.toSet()..remove(0);
                  }
                },
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('自己ベストが過去作よりも高い譜面'),
                value: others.value.contains(1),
                onChanged: (v) {
                  if (v ?? false) {
                    others.value = others.value.toSet()..add(1);
                  } else {
                    others.value = others.value.toSet()..remove(1);
                  }
                },
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('自己ベストが過去作よりも低い譜面'),
                value: others.value.contains(2),
                onChanged: (v) {
                  if (v ?? false) {
                    others.value = others.value.toSet()..add(2);
                  } else {
                    others.value = others.value.toSet()..remove(2);
                  }
                },
              ),
            ],
          ),
        ],
      ),
      persistentFooterButtons: [
        OutlinedButton(
          onPressed: () {},
          child: const Text('Cancel'),
        ),
        OutlinedButton(
          onPressed: () {},
          child: const Text('Reset'),
        ),
        OutlinedButton(
          onPressed: () async {},
          child: const Text('Filter'),
        ),
      ],
    );
  }
}
