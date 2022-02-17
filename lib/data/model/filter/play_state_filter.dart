import 'package:derasika2/data/model/score_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'filter.dart';

part 'play_state_filter.freezed.dart';
part 'play_state_filter.g.dart';

enum PlayState {
  all,
  everPlayed,
  played,
}

@freezed
class PlayStateFilter with _$PlayStateFilter implements Filter<PlayState> {
  const PlayStateFilter._();
  factory PlayStateFilter(
    @JsonKey(name: 'use') bool use,
    @JsonKey(name: 'condition') PlayState condition,
  ) = _PlayStateFilter;

  factory PlayStateFilter.fromJson(Map<String, dynamic> json) =>
      _$PlayStateFilterFromJson(json);

  @override
  bool Function(ScoreData) get filter {
    switch (condition) {
      case PlayState.all:
        return (ScoreData s) => true;
      case PlayState.everPlayed:
        return (ScoreData s) => s.bestScore != 0 || s.score != 0;
      case PlayState.played:
        return (ScoreData s) => s.score != 0;
      default:
        throw UnimplementedError();
    }
  }
}
