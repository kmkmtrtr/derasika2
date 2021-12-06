import 'package:derasika2/data/model/sp12_tier_data.dart';
import 'package:derasika2/data/repository/sp12_tier_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sp12TierViewModelProvider =
    ChangeNotifierProvider((ref) => Sp12TierViewModel(ref.read));

class Sp12TierViewModel extends ChangeNotifier {
  Sp12TierViewModel(this._reader);

  final Reader _reader;
  late final Sp12TierRepository _repository =
      _reader(sp12TierRepositoryProvider);

  List<Sp12TierData>? _clearTierData;
  List<Sp12TierData> get clearTierData => (_clearTierData ?? []);
  List<Sp12TierData>? _hardTierData;
  List<Sp12TierData> get hardTierData => (_hardTierData ?? []);

  Future<void> getTierList() {
    return _repository.getSp12TierList().then((value) {
      _clearTierData = value.toList()
        ..sort((a, b) => a.clearTierId == b.clearTierId
            ? a.title == b.title
                ? a.difficultyTypeId.compareTo(b.difficultyTypeId)
                : a.title.compareTo(b.title)
            : a.clearTierId.compareTo(b.clearTierId));
      _hardTierData = value.toList()
        ..sort((a, b) => a.hardTierId == b.hardTierId
            ? a.title == b.title
                ? a.difficultyTypeId.compareTo(b.difficultyTypeId)
                : a.title.compareTo(b.title)
            : a.hardTierId.compareTo(b.hardTierId));
    }).whenComplete(notifyListeners);
  }
}
