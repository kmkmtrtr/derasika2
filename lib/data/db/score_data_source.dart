import 'package:derasika2/data/db/app_db.dart';
import 'package:derasika2/data/model/csv/csv_since_heroic_verse.dart';
import 'package:derasika2/data/model/csv/csv_until_rootage.dart';
import 'package:derasika2/data/model/play_mode.dart';
import 'package:derasika2/data/model/score_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final scoreDataSourceProvider = Provider((ref) => ScoreDataSource(ref.read));

class ScoreDataSource {
  ScoreDataSource(this._reader);

  final Reader _reader;
  late final AppDB _appDb = _reader(appDBProvider);

  Future<List<ScoreData>> fetchVersionScores(int version, String? where,
      List<Object?>? whereArgs, String? orderBy, PlayMode playMode) async {
    final List<Object?> defaultArg = [version, playMode.index + 1];
    final whereCondition = (where == null || where == '')
        ? 'score_version_id=? and mode_type_id=?'
        : 'score_version_id=? and mode_type_id=? and ($where)';
    final db = await _appDb.connection;
    final data = await db.query(
      'version_score_view',
      where: whereCondition,
      whereArgs: defaultArg + (whereArgs ?? []),
      orderBy: orderBy,
    );
    return data
        .map(
          (e) => ScoreData(
            e['chart_id'] as int,
            e['title'] as String,
            e['level'] as int,
            e['difficulty'] as String,
            e['mode_type_id'] as int,
            e['score'] as int,
            e['djlevel_type'] as String,
            e['score_rate'] as double,
            e['score_pace'] as String,
            e['next_score_pace'] as String,
            e['prev_score'] as int?,
            e['best_score'] as int?,
            e['clear_type'] as String,
            int.tryParse(e['misscount'].toString()),
            int.tryParse(e['prev_misscount']?.toString() ?? ''),
            int.tryParse(e['best_misscount']?.toString() ?? ''),
          ),
        )
        .toList();
  }

  Future<int> fetchCurrentVersionId() async {
    final db = await _appDb.connection;
    final format = DateFormat('yyyy-MM-dd', 'ja-jp');
    final rec = await db.query('version_master',
        columns: ['id', 'max(rank)'],
        where: 'start_at <= ?',
        whereArgs: [format.format(DateTime.now())]);
    return rec.first['id'] as int;
  }

  Future<void> upsertCsvUntilRootage(
      List<CsvUntilRootage> csv, PlayMode playMode) async {
    final db = await _appDb.connection;
    await db.execute('drop table if exists csvtemp;');
    await db.execute('''
    create table csvtemp
    (
      version text not null,
      title text not null,
      genre text not null,
      artist text not null,
      playcount text not null,
      normal_level text not null,
      normal_ex_score text not null,
      normal_pgreat text not null,
      normal_great text not null,
      normal_misscount text not null,
      normal_clear_type text not null,
      normal_djlevel text not null,
      hyper_level text not null,
      hyper_ex_score text not null,
      hyper_pgreat text not null,
      hyper_great text not null,
      hyper_misscount text not null,
      hyper_clear_type text not null,
      hyper_djlevel text not null,
      another_level text not null,
      another_ex_score text not null,
      another_pgreat text not null,
      another_great text not null,
      another_misscount text not null,
      another_clear_type text not null,
      another_djlevel text not null,
      lastplay_at text not null
    );''');

    await db.transaction(
      (txn) async {
        final batch = txn.batch();
        for (var record in csv) {
          final map = {
            'version': record.version,
            'title': record.title,
            'genre': record.genre,
            'artist': record.artist,
            'playcount': record.playcount,
            'normal_level': record.normalLevel,
            'normal_ex_score': record.normalExScore,
            'normal_pgreat': record.normalPgreat,
            'normal_great': record.normalGreat,
            'normal_misscount': record.normalMisscount,
            'normal_clear_type': record.normalClearType,
            'normal_djlevel': record.normalDjlevel,
            'hyper_level': record.hyperLevel,
            'hyper_ex_score': record.hyperExScore,
            'hyper_pgreat': record.hyperPgreat,
            'hyper_great': record.hyperGreat,
            'hyper_misscount': record.hyperMisscount,
            'hyper_clear_type': record.hyperClearType,
            'hyper_djlevel': record.hyperDjlevel,
            'another_level': record.anotherLevel,
            'another_ex_score': record.anotherExScore,
            'another_pgreat': record.anotherPgreat,
            'another_great': record.anotherGreat,
            'another_misscount': record.anotherMisscount,
            'another_clear_type': record.anotherClearType,
            'another_djlevel': record.anotherDjlevel,
            'lastplay_at': record.lastplayAt
          };
          batch.insert('csvtemp', map);
        }
        await batch.commit();
        await txn.rawInsert('''
      insert into score
      select cm.id chart_id,
             ct.id clear_type_id,
             dl.id djlevel_type_id,
             csv.score,
             case when cm.notes = 0 then ''
                  when csv.djlevel = 'F' then 'F+' || (csv.score)
                  when csv.djlevel = 'E' then 'E+' || (csv.score-cm.rank_e)
                  when csv.djlevel = 'D' then 'D+' || (csv.score-cm.rank_d)
                  when csv.djlevel = 'C' then 'C+' || (csv.score-cm.rank_c)
                  when csv.djlevel = 'B' then 'B+' || (csv.score-cm.rank_b)
                  when csv.djlevel = 'A' then 'A+' || (csv.score-cm.rank_a)
                  when csv.djlevel = 'AA' then 'AA+' || (csv.score-cm.rank_aa)
                  when csv.djlevel = 'AAA' then 'AAA+' || (csv.score-cm.rank_aaa)
                  else ''
             end score_pace ,
             case when cm.notes = 0 then ''
                  when csv.djlevel = 'F' then 'E' || (csv.score-cm.rank_e)
                  when csv.djlevel = 'E' then 'D' || (csv.score-cm.rank_d)
                  when csv.djlevel = 'D' then 'C' || (csv.score-cm.rank_c)
                  when csv.djlevel = 'C' then 'B' || (csv.score-cm.rank_b)
                  when csv.djlevel = 'B' then 'A' || (csv.score-cm.rank_a)
                  when csv.djlevel = 'A' then 'AA' || (csv.score-cm.rank_aa)
                  when csv.djlevel = 'AA' then 'AAA' || (csv.score-cm.rank_aaa)
                  when csv.djlevel = 'AAA' then 'MAX' || (csv.score-cm.max)
                  else ''
             end next_score_pace ,
             ifnull(round(cast(csv.score as real)/cast(cm.max as real)*100,2),0.0) score_rate,
             cast(csv.score*(100+ct.bonus+dl.bonus)as real)/10000 djpoint,
             csv.misscount,
             case when bs.updated_at is null then 1
                  when bs.updated_at = substr(csv.lastplay_at,1,10) then bs.before_clear_type_id
                  else bs.clear_type_id
             end before_clear_type_id,
             case when mv.version_id <> bs.version_id then 1
                  when bs.updated_at is null then 1
                  when bs.updated_at = substr(csv.lastplay_at,1,10) then bs.before_djlevel_type_id
                  else bs.djlevel_type_id
             end before_djlevel_type_id,
             case when mv.version_id <> bs.version_id then 0
                  when bs.updated_at is null then 0
                  when bs.updated_at = substr(csv.lastplay_at,1,10) then bs.before_score
                  else bs.score
             end before_score,
             case when mv.version_id <> bs.version_id then 0.0
                  when bs.updated_at is null then 0.0
                  when bs.updated_at = substr(csv.lastplay_at,1,10) then bs.before_score_rate
                  else bs.score_rate
             end before_score_rate,
             case when mv.version_id <> bs.version_id then 0.0
                  when bs.updated_at is null then 0.0
                  when bs.updated_at = substr(csv.lastplay_at,1,10) then bs.before_djpoint
                  else bs.djpoint
             end before_djpoint,
             case when mv.version_id <> bs.version_id then '---'
                  when bs.updated_at is null then '---'
                  when bs.updated_at = substr(csv.lastplay_at,1,10) then bs.before_misscount
                  else bs.misscount
             end before_misscount,
             mv.version_id version_id,
             substr(csv.lastplay_at,1,10) updated_at
        from (select version, trim(title) title, genre, artist, playcount, 'NORMAL' difficulty, normal_level level, normal_ex_score score, normal_pgreat pgreat, normal_great great, normal_misscount misscount, normal_clear_type clear_type, normal_djlevel djlevel, lastplay_at
	            from csvtemp
               where level <> 0 union
              select version, trim(title) title, genre, artist, playcount, 'HYPER' difficulty, hyper_level level, hyper_ex_score score, hyper_pgreat pgreat, hyper_great great, hyper_misscount misscount, hyper_clear_type clear_type, hyper_djlevel djlevel, lastplay_at
                from csvtemp
			   where level <> 0 union
              select version, trim(title) title, genre, artist, playcount, 'ANOTHER' difficulty, another_level level, another_ex_score score, another_pgreat pgreat, another_great great, another_misscount misscount, another_clear_type clear_type, another_djlevel djlevel, lastplay_at
                from csvtemp
               where not (trim(title) like '%†' or trim(title) like '%†LEGGENDARIA') and level <> 0 union
              select version, trim(replace(replace(trim(title),'LEGGENDARIA',''),'†','')) title, genre, artist, playcount, 'LEGGENDARIA' difficulty, another_level level, another_ex_score score, another_pgreat pgreat, another_great great, another_misscount misscount, another_clear_type clear_type, another_djlevel djlevel, lastplay_at
                from csvtemp
               where (trim(title) like '%†' or trim(title) like '%†LEGGENDARIA') and level <> 0) csv
       inner join difficulty_type dt
          on csv.difficulty = dt.difficulty
       inner join clear_type ct
          on csv.clear_type = ct.clear_type
       inner join djlevel_type dl
          on csv.djlevel = dl.djlevel_type
        left join csv_relation cr
          on csv.title = cr.title
        left join chart_master cm
          on cr.song_id = cm.song_id
         and cm.mode_type_id = ?
         and cm.difficulty_type_id = dt.id
        left join (select *, max(updated_at) from score group by chart_id) bs
          on cm.id = bs.chart_id
       inner join (select id, 
                          (select max(id)
                             from version_master
                            where start_at < (select min(lastplay_at)
                                                from csvtemp)) version_id
                     from chart_master) mv
	      on cm.id = mv.id
       where cm.id is not null
	   order by chart_id''', [playMode == PlayMode.sp ? 1 : 2]);
      },
    );
    await _realculation();
  }

  Future<void> upsertCsvSinceHeroicVerse(
      List<CsvSinceHeroicVerse> csv, PlayMode playMode) async {
    final db = await _appDb.connection;
    await db.execute('drop table if exists csvtemp;');
    await db.execute('''
    create table csvtemp
    (
      version text not null,
      title text not null,
      genre text not null,
      artist text not null,
      playcount text not null,
      beginner_level text not null,
      beginner_ex_score text not null,
      beginner_pgreat text not null,
      beginner_great text not null,
      beginner_misscount text not null,
      beginner_clear_type text not null,
      beginner_djlevel text not null,
      normal_level text not null,
      normal_ex_score text not null,
      normal_pgreat text not null,
      normal_great text not null,
      normal_misscount text not null,
      normal_clear_type text not null,
      normal_djlevel text not null,
      hyper_level text not null,
      hyper_ex_score text not null,
      hyper_pgreat text not null,
      hyper_great text not null,
      hyper_misscount text not null,
      hyper_clear_type text not null,
      hyper_djlevel text not null,
      another_level text not null,
      another_ex_score text not null,
      another_pgreat text not null,
      another_great text not null,
      another_misscount text not null,
      another_clear_type text not null,
      another_djlevel text not null,
      leggendaria_level text not null,
      leggendaria_ex_score text not null,
      leggendaria_pgreat text not null,
      leggendaria_great text not null,
      leggendaria_misscount text not null,
      leggendaria_clear_type text not null,
      leggendaria_djlevel text not null,
      lastplay_at text not null
    );''');

    await db.transaction(
      (txn) async {
        final batch = txn.batch();
        for (var record in csv) {
          final map = {
            'version': record.version,
            'title': record.title,
            'genre': record.genre,
            'artist': record.artist,
            'playcount': record.playcount,
            'beginner_level': record.beginnerLevel,
            'beginner_ex_score': record.beginnerExScore,
            'beginner_pgreat': record.beginnerPgreat,
            'beginner_great': record.beginnerGreat,
            'beginner_misscount': record.beginnerMisscount,
            'beginner_clear_type': record.beginnerClearType,
            'beginner_djlevel': record.beginnerDjlevel,
            'normal_level': record.normalLevel,
            'normal_ex_score': record.normalExScore,
            'normal_pgreat': record.normalPgreat,
            'normal_great': record.normalGreat,
            'normal_misscount': record.normalMisscount,
            'normal_clear_type': record.normalClearType,
            'normal_djlevel': record.normalDjlevel,
            'hyper_level': record.hyperLevel,
            'hyper_ex_score': record.hyperExScore,
            'hyper_pgreat': record.hyperPgreat,
            'hyper_great': record.hyperGreat,
            'hyper_misscount': record.hyperMisscount,
            'hyper_clear_type': record.hyperClearType,
            'hyper_djlevel': record.hyperDjlevel,
            'another_level': record.anotherLevel,
            'another_ex_score': record.anotherExScore,
            'another_pgreat': record.anotherPgreat,
            'another_great': record.anotherGreat,
            'another_misscount': record.anotherMisscount,
            'another_clear_type': record.anotherClearType,
            'another_djlevel': record.anotherDjlevel,
            'leggendaria_level': record.leggendariaLevel,
            'leggendaria_ex_score': record.leggendariaExScore,
            'leggendaria_pgreat': record.leggendariaPgreat,
            'leggendaria_great': record.leggendariaGreat,
            'leggendaria_misscount': record.leggendariaMisscount,
            'leggendaria_clear_type': record.leggendariaClearType,
            'leggendaria_djlevel': record.leggendariaDjlevel,
            'lastplay_at': record.lastplayAt
          };
          batch.insert('csvtemp', map);
        }
        await batch.commit();
        await txn.rawInsert('''
      insert into score
      select cm.id chart_id,
             ct.id clear_type_id,
             dl.id djlevel_type_id,
             csv.score,
             case when cm.notes = 0 then ''
                  when csv.djlevel = 'F' then 'F+' || (csv.score)
                  when csv.djlevel = 'E' then 'E+' || (csv.score-cm.rank_e)
                  when csv.djlevel = 'D' then 'D+' || (csv.score-cm.rank_d)
                  when csv.djlevel = 'C' then 'C+' || (csv.score-cm.rank_c)
                  when csv.djlevel = 'B' then 'B+' || (csv.score-cm.rank_b)
                  when csv.djlevel = 'A' then 'A+' || (csv.score-cm.rank_a)
                  when csv.djlevel = 'AA' then 'AA+' || (csv.score-cm.rank_aa)
                  when csv.djlevel = 'AAA' then 'AAA+' || (csv.score-cm.rank_aaa)
                  else ''
             end score_pace ,
             case when cm.notes = 0 then ''
                  when csv.djlevel = 'F' then 'E' || (csv.score-cm.rank_e)
                  when csv.djlevel = 'E' then 'D' || (csv.score-cm.rank_d)
                  when csv.djlevel = 'D' then 'C' || (csv.score-cm.rank_c)
                  when csv.djlevel = 'C' then 'B' || (csv.score-cm.rank_b)
                  when csv.djlevel = 'B' then 'A' || (csv.score-cm.rank_a)
                  when csv.djlevel = 'A' then 'AA' || (csv.score-cm.rank_aa)
                  when csv.djlevel = 'AA' then 'AAA' || (csv.score-cm.rank_aaa)
                  when csv.djlevel = 'AAA' then 'MAX' || (csv.score-cm.max)
                  else ''
             end next_score_pace ,
             ifnull(round(cast(csv.score as real)/cast(cm.max as real)*100,2),0.0) score_rate,
             cast(csv.score*(100+ct.bonus+dl.bonus)as real)/10000 djpoint,
             csv.misscount,
             case when bs.updated_at is null then 1
                  when bs.updated_at = substr(csv.lastplay_at,1,10) then bs.before_clear_type_id
                  else bs.clear_type_id
             end before_clear_type_id,
             case when mv.version_id <> bs.version_id then 1
                  when bs.updated_at is null then 1
                  when bs.updated_at = substr(csv.lastplay_at,1,10) then bs.before_djlevel_type_id
                  else bs.djlevel_type_id
             end before_djlevel_type_id,
             case when mv.version_id <> bs.version_id then 0
                  when bs.updated_at is null then 0
                  when bs.updated_at = substr(csv.lastplay_at,1,10) then bs.before_score
                  else bs.score
             end before_score,
             case when mv.version_id <> bs.version_id then 0.0
                  when bs.updated_at is null then 0.0
                  when bs.updated_at = substr(csv.lastplay_at,1,10) then bs.before_score_rate
                  else bs.score_rate
             end before_score_rate,
             case when mv.version_id <> bs.version_id then 0.0
                  when bs.updated_at is null then 0.0
                  when bs.updated_at = substr(csv.lastplay_at,1,10) then bs.before_djpoint
                  else bs.djpoint
             end before_djpoint,
             case when mv.version_id <> bs.version_id then '---'
                  when bs.updated_at is null then '---'
                  when bs.updated_at = substr(csv.lastplay_at,1,10) then bs.before_misscount
                  else bs.misscount
             end before_misscount,
             mv.version_id version_id,
             substr(csv.lastplay_at,1,10) updated_at
        from (select version, trim(title) title, genre, artist, playcount, 'BEGINNER' difficulty, beginner_level level, beginner_ex_score score, beginner_pgreat pgreat, beginner_great great, beginner_misscount misscount, beginner_clear_type clear_type, beginner_djlevel djlevel, lastplay_at
                from csvtemp
               where level <> 0 union
              select version, trim(title) title, genre, artist, playcount, 'NORMAL' difficulty, normal_level level, normal_ex_score score, normal_pgreat pgreat, normal_great great, normal_misscount misscount, normal_clear_type clear_type, normal_djlevel djlevel, lastplay_at
                from csvtemp
               where level <> 0 union
              select version, trim(title) title, genre, artist, playcount, 'HYPER' difficulty, hyper_level level, hyper_ex_score score, hyper_pgreat pgreat, hyper_great great, hyper_misscount misscount, hyper_clear_type clear_type, hyper_djlevel djlevel, lastplay_at
                from csvtemp
               where level <> 0 union
              select version, trim(title) title, genre, artist, playcount, 'ANOTHER' difficulty, another_level level, another_ex_score score, another_pgreat pgreat, another_great great, another_misscount misscount, another_clear_type clear_type, another_djlevel djlevel, lastplay_at
                from csvtemp
               where level <> 0 union
              select version, trim(title) title, genre, artist, playcount, 'LEGGENDARIA' difficulty, leggendaria_level level, leggendaria_ex_score score, leggendaria_pgreat pgreat, leggendaria_great great, leggendaria_misscount misscount, leggendaria_clear_type clear_type, leggendaria_djlevel djlevel, lastplay_at
                from csvtemp
               where level <> 0) csv
       inner join difficulty_type dt
          on csv.difficulty = dt.difficulty
       inner join clear_type ct
          on csv.clear_type = ct.clear_type
       inner join djlevel_type dl
          on csv.djlevel = dl.djlevel_type
        left join csv_relation cr
          on csv.title = cr.title
        left join chart_master cm
          on cr.song_id = cm.song_id
         and cm.mode_type_id = ?
         and cm.difficulty_type_id = dt.id
        left join (select *, max(updated_at) from score group by chart_id) bs
          on cm.id = bs.chart_id
       inner join (select id, 
                          (select max(id)
                             from version_master
                            where start_at < (select min(lastplay_at)
                                                from csvtemp)) version_id
                     from chart_master) mv
	      on cm.id = mv.id
       where cm.id is not null
	   order by chart_id''', [playMode == PlayMode.sp ? 1 : 2]);
      },
    );
    await _realculation();
  }

  Future<void> _realculation() async {
    final db = await _appDb.connection;
    await db.transaction((txn) async {
      await txn.rawInsert('''
      insert or replace into score
      select sc.chart_id,
             sc.clear_type_id,
             sc.djlevel_type_id,
             sc.score,
             case when cm.notes = 0 then ''
                  when dt.djlevel_type = 'F' then 'F+' || (sc.score)
                  when dt.djlevel_type = 'E' then 'E+' || (sc.score-cm.rank_e)
                  when dt.djlevel_type = 'D' then 'D+' || (sc.score-cm.rank_d)
                  when dt.djlevel_type = 'C' then 'C+' || (sc.score-cm.rank_c)
                  when dt.djlevel_type = 'B' then 'B+' || (sc.score-cm.rank_b)
                  when dt.djlevel_type = 'A' then 'A+' || (sc.score-cm.rank_a)
                  when dt.djlevel_type = 'AA' then 'AA+' || (sc.score-cm.rank_aa)
                  when dt.djlevel_type = 'AAA' then 'AAA+' || (sc.score-cm.rank_aaa)
                  else ''
             end score_pace ,
             case when cm.notes = 0 then ''
                  when dt.djlevel_type = 'F' then 'E' || (sc.score-cm.rank_e)
                  when dt.djlevel_type = 'E' then 'D' || (sc.score-cm.rank_d)
                  when dt.djlevel_type = 'D' then 'C' || (sc.score-cm.rank_c)
                  when dt.djlevel_type = 'C' then 'B' || (sc.score-cm.rank_b)
                  when dt.djlevel_type = 'B' then 'A' || (sc.score-cm.rank_a)
                  when dt.djlevel_type = 'A' then 'AA' || (sc.score-cm.rank_aa)
                  when dt.djlevel_type = 'AA' then 'AAA' || (sc.score-cm.rank_aaa)
                  when dt.djlevel_type = 'AAA' then 'MAX' || (sc.score-cm.max)
                  else ''
             end next_score_pace ,
			       ifnull(round(cast(sc.score as double)/ cast(cm.max as double) * 100,2),0.0) score_rate,
             sc.djpoint,
             sc.misscount,
             case when max(bs.updated_at) is null then 1
                  when max(bs.updated_at) = sc.updated_at then bs.before_clear_type_id
                  else bs.clear_type_id
              end before_clear_type_id,
             case when sc.version_id <> bs.version_id then 1
                  when max(bs.updated_at) is null then 1
                  when max(bs.updated_at) = sc.updated_at then bs.before_djlevel_type_id
                  else bs.djlevel_type_id
              end before_djlevel_type_id,
             case when sc.version_id <> bs.version_id then 0
                  when max(bs.updated_at) is null then 0
                  when max(bs.updated_at) = sc.updated_at then bs.before_score
                  else bs.score
              end before_score,
             case when sc.version_id <> bs.version_id then 0.0
                  when max(bs.updated_at) is null then 0.0
                  when max(bs.updated_at) = sc.updated_at then bs.before_score_rate
                  else bs.score_rate
              end before_score_rate,
             case when sc.version_id <> bs.version_id then 0.0
                  when max(bs.updated_at) is null then 0.0
                  when max(bs.updated_at) = sc.updated_at then bs.before_djpoint
                  else bs.djpoint
              end before_djpoint,
             case when sc.version_id <> bs.version_id then '---'
                  when max(bs.updated_at) is null then '---'
                  when max(bs.updated_at) = sc.updated_at then bs.before_misscount
                  else bs.misscount
              end before_misscount,
             sc.version_id,
             sc.updated_at
        from score sc
        left join (select * from score) bs
          on sc.chart_id = bs.chart_id
         and sc.updated_at > bs.updated_at
		left join  chart_master cm
		  on sc.chart_id = cm.id
		left join djlevel_type dt
		  on sc.djlevel_type_id = dt.id
       group by sc.chart_id, sc.version_id, sc.updated_at
       order by sc.chart_id, sc.updated_at''');
    });
  }
}
