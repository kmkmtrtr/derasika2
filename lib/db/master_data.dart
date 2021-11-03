import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:derasika2/db/app_database.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class MasterData {
  final masterSiteUri = 'https://beatmania-score-manager.web.app/';

  Future<Uint8List> fetchNewMasterDb() async {
    final client = HttpClient();
    final request =
        await client.getUrl(Uri.parse(masterSiteUri + AppDatabase.dbName));
    final response = await request.close();
    client.close();
    return await consolidateHttpClientResponseBytes(response);
  }

  Future updateMaster(File masterDb) async {
    const masterVersionName = 'masterupdatedat.json';
    final List<Map<String, dynamic>> masterJsonVersions =
        await fetchJson(masterVersionName);
    // DBのマスターのバージョンとjsonのバージョンを比較し、更新する必要があるものを取得
    final db = await openDatabase(masterDb.path);
    final localVersions = await db.rawQuery(
        '''select title, version from master_updated_at order by rank''');
    await db.transaction((txn) async {
      for (var item in localVersions) {
        final records =
            masterJsonVersions.where((x) => x['title'] == item['title']);
        if (records.isEmpty) {
          continue;
        }
        final record = records.first;
        if (DateTime.parse(record['version'])
            .isAfter(DateTime.parse(item['version'] as String))) {
          // 更新するマスターをダウンロード
          final masterJson = await fetchJson(record['fileName']);
          await txn.update(
              'master_updated_at', {'version': masterJson['version']},
              where: 'title = ?', whereArgs: [masterJson['title']]);
          //マスターのjsonとトランザクションを渡したらやってくれるようにする
          updateTable(masterJson, txn);
          //もしかして、新しいDBダウンロードしてきて
          //データを移し替えたほうが早いんじゃない？？？
        }
      }
    });
  }

  Future updateTable(dynamic json, Transaction txn) async {
    final title = json['title'];
    final data = json['data'];
    switch (title) {
      case 'version_master':
        for (var rec in data) {
          await txn.insert(
              title,
              {
                'id': rec['id'],
                'version': rec['version'],
                'start_at': rec['start_at'],
                'rank': rec['rank']
              },
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
        break;
      case 'song_master':
        for (var rec in data) {
          await txn.insert(
              title,
              {
                'id': rec['id'],
                'title': rec['title'],
                'artist': rec['artist'],
                'genre': rec['genre'],
                'version_id': rec['version_id']
              },
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
        break;
      case 'csv_relation':
        for (var rec in data) {
          await txn.insert(
              title, {'song_id': rec['song_id'], 'title': rec['title']},
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
        break;
      case 'deleted_song_master':
        for (var rec in data) {
          await txn.insert(title,
              {'song_id': rec['song_id'], 'deleted_at': rec['deleted_at']},
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
        break;
      case 'mode_type':
        for (var rec in data) {
          await txn.insert(title,
              {'id': rec['id'], 'mode': rec['mode'], 'rank': rec['rank']},
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
        break;
      case 'difficulty_type':
        for (var rec in data) {
          await txn.insert(
              title,
              {
                'id': rec['id'],
                'difficulty': rec['difficulty'],
                'rank': rec['rank']
              },
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
        break;
      case 'clear_type':
        for (var rec in data) {
          await txn.insert(
              title,
              {
                'id': rec['id'],
                'clear_type': rec['clear_type'],
                'rank': rec['rank']
              },
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
        break;
      case 'djlevel_type':
        for (var rec in data) {
          await txn.insert(
              title,
              {
                'id': rec['id'],
                'djlevel_type': rec['djlevel_type'],
                'rank': rec['rank']
              },
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
        break;
      case 'chart_master':
        for (var rec in data) {
          await txn.insert(
              title,
              {
                'song_id': rec['song_id'],
                'id': rec['id'],
                'mode_type_id': rec['mode_type_id'],
                'difficulty_type_id': rec['difficulty_type_id'],
                'level': rec['level'],
                'max_bpm': rec['max_bpm'],
                'min_bpm': rec['min_bpm'],
                'cn_type_id': rec['cn_type_id'],
                'notes': rec['notes'],
                'rank_e': rec['rank_e'],
                'rank_d': rec['rank_d'],
                'rank_c': rec['rank_c'],
                'rank_b': rec['rank_b'],
                'rank_a': rec['rank_a'],
                'rank_aa': rec['rank_aa'],
                'rank_aaa': rec['rank_aaa'],
                'max': rec['max']
              },
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
        break;
      case 'bpi_master':
        for (var rec in data) {
          await txn.insert(
              title,
              {
                'chart_id': rec['chart_id'],
                'kaiden_average': rec['kaiden_average'],
                'top': rec['top']
              },
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
        break;
      case 'dp_unofficial_tier_level_master':
        for (var rec in data) {
          await txn.insert(title,
              {'id': rec['id'], 'level': rec['level'], 'rank': rec['rank']},
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
        break;
      case 'dp_unofficial_tier_master':
        for (var rec in data) {
          await txn.insert(
              title, {'chart_id': rec['chart_id'], 'class_id': rec['class_id']},
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
        break;
      case 'sp12_unofficial_tier_class_master':
        for (var rec in data) {
          await txn.insert(
              title,
              {
                'id': rec['id'],
                'tier_class': rec['tier_class'],
                'rank': rec['rank']
              },
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
        break;
      case 'sp12_unofficial_tier_master':
        for (var rec in data) {
          await txn.insert(
              title,
              {
                'chart_id': rec['chart_id'],
                'clear_tier_id': rec['clear_tier_id'],
                'hard_tier_id': rec['hard_tier_id']
              },
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
        break;
      case 'textage':
        for (var rec in data) {
          await txn.insert(
              title,
              {
                'chart_id': rec['chart_id'],
                'playside': rec['playside'],
                'textage_url': rec['textage_url']
              },
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
        break;
      default:
    }
  }

  Future<dynamic> fetchJson(String fileName) async {
    final client = HttpClient();
    final request = await client.getUrl(Uri.parse(masterSiteUri + fileName));
    final response = await request.close();
    client.close();
    final responseBody = await response.transform(utf8.decoder).join();
    return json.decode(responseBody);
  }
}
