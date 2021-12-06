import 'package:freezed_annotation/freezed_annotation.dart';

part 'sp12_tier_data.freezed.dart';
part 'sp12_tier_data.g.dart';

@freezed
abstract class Sp12TierData with _$Sp12TierData {
  factory Sp12TierData(
    @JsonKey(name: 'chart_id') int chartId,
    @JsonKey(name: 'title') String title,
    @JsonKey(name: 'difficulty_type_id') int difficultyTypeId,
    @JsonKey(name: 'difficulty') String difficulty,
    @JsonKey(name: 'clear_tier_id') int clearTierId,
    @JsonKey(name: 'clear_tier_class') String clearTierClass,
    @JsonKey(name: 'hard_tier_id') int hardTierId,
    @JsonKey(name: 'hard_tier_class') String hardTierClass,
    @JsonKey(name: 'clear_type_id') int clearTypeId,
    @JsonKey(name: 'clear_type') String clearType,
  ) = _Sp12TierData;

  factory Sp12TierData.fromJson(Map<String, dynamic> json) =>
      _$Sp12TierDataFromJson(json);
}
