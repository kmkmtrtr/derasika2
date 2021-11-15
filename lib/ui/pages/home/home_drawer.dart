import 'dart:io';
import 'package:derasika2/data/model/play_mode.dart';
import 'package:derasika2/ui/pages/home/home_view_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
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
                _getMenuItem(context, Icons.history, '更新履歴', '/updatelog'),
                _getMenuItem(context, Icons.grade, 'SP12地力表', '/sp12tier'),
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

  ListTile _getMenuItem(
      BuildContext context, IconData icon, String s, String routeName) {
    return ListTile(
      leading: Icon(icon),
      title: Text(s),
      onTap: () {
        // Navigator.pop(context);
        // Navigator.of(context).pushNamed(routeName);
      },
    );
  }

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