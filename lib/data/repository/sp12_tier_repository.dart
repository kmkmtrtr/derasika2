import 'package:derasika2/data/db/sp12_tier_data_source.dart';
import 'package:derasika2/data/model/sp12_tier_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sp12TierRepositoryProvider =
    Provider((ref) => Sp12TierRepository(ref.read));

class Sp12TierRepository {
  Sp12TierRepository(this._reader);

  final Reader _reader;
  late final Sp12TierDataSource _sp12TierDataSource =
      _reader(sp12TierDataSourceProvider);

  Future<List<Sp12TierData>> getSp12TierList() {
    return _sp12TierDataSource.fetchSp12TierList();
  }
}
