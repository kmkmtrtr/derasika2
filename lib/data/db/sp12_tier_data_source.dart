import 'package:derasika2/data/db/app_db.dart';
import 'package:derasika2/data/model/sp12_tier_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sp12TierDataSourceProvider =
    Provider((ref) => Sp12TierDataSource(ref.read));

class Sp12TierDataSource {
  Sp12TierDataSource(this._reader);

  final Reader _reader;
  late final AppDB _appDb = _reader(appDBProvider);

  Future<List<Sp12TierData>> fetchSp12TierList() async {
    final db = await _appDb.connection;
    final data = await db.query(
      'sp12_tier_view',
    );
    return data.map((e) => Sp12TierData.fromJson(e)).toList();
  }
}
