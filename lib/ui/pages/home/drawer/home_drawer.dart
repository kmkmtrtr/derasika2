import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:derasika2/data/model/enum/play_mode.dart';
import 'package:derasika2/ui/pages/home/home_view_model.dart';
import 'package:derasika2/ui/route/app_route.gr.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:share_plus/share_plus.dart';

class HomeDrawer extends HookConsumerWidget {
  HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewModel = ref.read(homeViewModelProvider);

    return Drawer(
      child: Column(
        children: <Widget>[
          _headerChild,
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.history),
                  title: const Text('更新履歴'),
                  onTap: () {
                    context.popRoute();
                    context.pushRoute(const PlayLogRoute());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.analytics),
                  title: const Text('統計'),
                  onTap: () {
                    context.popRoute();
                    context.pushRoute(const StatisticRoute());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.grade),
                  title: const Text('SP12地力表'),
                  onTap: () {
                    context.popRoute();
                    context.pushRoute(const Sp12TierRoute());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.file_download),
                  title: const Text('前作スコア読み込み'),
                  onTap: () {
                    // Navigator.pop(context);
                    // Navigator.of(context).push(
                    // MaterialPageRoute(
                    // builder: (BuildContext context) {
                    // return WebViewArea(0, model.playMode);
                    // },
                    // fullscreenDialog: true),
                    // );
                  },
                ),
                aboutMenu,
              ],
            ),
          ),
          bottomButton,
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: ToggleButtons(
              children: const <Widget>[
                Text('SP'),
                Text('DP'),
              ],
              onPressed: (int index) {
                ref
                    .watch(homeViewModelProvider)
                    .changeMode(index == 0 ? PlayMode.sp : PlayMode.dp);
              },
              isSelected: <bool>[
                homeViewModel.playMode == PlayMode.sp,
                homeViewModel.playMode == PlayMode.dp
              ],
            ),
          )
        ],
      ),
    );
  }

  final _headerChild = const DrawerHeader(
    child: Text("menu"),
  );

  final aboutMenu = const AboutListTile(
      child: Text("About"),
      applicationName: "Derasika2",
      applicationVersion: "v1.0.0",
      applicationIcon: Icon(Icons.adb),
      icon: Icon(Icons.info));

  final bottomButton = ButtonBar(
    children: <Widget>[
      // CsvImportButton(),
      IconButton(
        icon: const Icon(Icons.cloud_download),
        onPressed: () async {
          final filePickResult =
              await FilePicker.platform.pickFiles(type: FileType.any);
          if (filePickResult == null || !filePickResult.isSinglePick) {
            return;
          }
          final file = filePickResult.files.first;
          final pickedFilePath = file.path;
          if (!file.name.endsWith('.db') || pickedFilePath == null) {
            return;
          }
          // dbチェックすること
          final documentDirectory = await getApplicationDocumentsDirectory();
          final dataDbPath = path.join(documentDirectory.path, 'data.db');
          final db = File(dataDbPath);
          await db.writeAsBytes(await File(pickedFilePath).readAsBytes());
        },
      ),
      IconButton(
        icon: const Icon(Icons.backup),
        onPressed: () async {
          final documentDirectory = await getApplicationDocumentsDirectory();
          final targetPath = path.join(documentDirectory.path, 'data.db');
          Share.shareFiles([targetPath]);
        },
      ),
    ],
  );
}
