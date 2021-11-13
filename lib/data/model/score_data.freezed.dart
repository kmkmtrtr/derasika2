// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'score_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScoreData _$ScoreDataFromJson(Map<String, dynamic> json) {
  return _ScoreData.fromJson(json);
}

/// @nodoc
class _$ScoreDataTearOff {
  const _$ScoreDataTearOff();

  _ScoreData call(
      int chartId,
      String title,
      int level,
      String difficulty,
      int modeType,
      int score,
      String djLevel,
      double scoreRate,
      String scorePace,
      String nextScorePace,
      int? prevScore,
      int? bestScore,
      String clearType,
      int? misscount,
      int? prevMisscount,
      int? bestMisscount) {
    return _ScoreData(
      chartId,
      title,
      level,
      difficulty,
      modeType,
      score,
      djLevel,
      scoreRate,
      scorePace,
      nextScorePace,
      prevScore,
      bestScore,
      clearType,
      misscount,
      prevMisscount,
      bestMisscount,
    );
  }

  ScoreData fromJson(Map<String, Object?> json) {
    return ScoreData.fromJson(json);
  }
}

/// @nodoc
const $ScoreData = _$ScoreDataTearOff();

/// @nodoc
mixin _$ScoreData {
  int get chartId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  String get difficulty => throw _privateConstructorUsedError;
  int get modeType => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  String get djLevel => throw _privateConstructorUsedError;
  double get scoreRate => throw _privateConstructorUsedError;
  String get scorePace => throw _privateConstructorUsedError;
  String get nextScorePace => throw _privateConstructorUsedError;
  int? get prevScore => throw _privateConstructorUsedError;
  int? get bestScore => throw _privateConstructorUsedError;
  String get clearType => throw _privateConstructorUsedError;
  int? get misscount => throw _privateConstructorUsedError;
  int? get prevMisscount => throw _privateConstructorUsedError;
  int? get bestMisscount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScoreDataCopyWith<ScoreData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreDataCopyWith<$Res> {
  factory $ScoreDataCopyWith(ScoreData value, $Res Function(ScoreData) then) =
      _$ScoreDataCopyWithImpl<$Res>;
  $Res call(
      {int chartId,
      String title,
      int level,
      String difficulty,
      int modeType,
      int score,
      String djLevel,
      double scoreRate,
      String scorePace,
      String nextScorePace,
      int? prevScore,
      int? bestScore,
      String clearType,
      int? misscount,
      int? prevMisscount,
      int? bestMisscount});
}

/// @nodoc
class _$ScoreDataCopyWithImpl<$Res> implements $ScoreDataCopyWith<$Res> {
  _$ScoreDataCopyWithImpl(this._value, this._then);

  final ScoreData _value;
  // ignore: unused_field
  final $Res Function(ScoreData) _then;

  @override
  $Res call({
    Object? chartId = freezed,
    Object? title = freezed,
    Object? level = freezed,
    Object? difficulty = freezed,
    Object? modeType = freezed,
    Object? score = freezed,
    Object? djLevel = freezed,
    Object? scoreRate = freezed,
    Object? scorePace = freezed,
    Object? nextScorePace = freezed,
    Object? prevScore = freezed,
    Object? bestScore = freezed,
    Object? clearType = freezed,
    Object? misscount = freezed,
    Object? prevMisscount = freezed,
    Object? bestMisscount = freezed,
  }) {
    return _then(_value.copyWith(
      chartId: chartId == freezed
          ? _value.chartId
          : chartId // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      difficulty: difficulty == freezed
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      modeType: modeType == freezed
          ? _value.modeType
          : modeType // ignore: cast_nullable_to_non_nullable
              as int,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      djLevel: djLevel == freezed
          ? _value.djLevel
          : djLevel // ignore: cast_nullable_to_non_nullable
              as String,
      scoreRate: scoreRate == freezed
          ? _value.scoreRate
          : scoreRate // ignore: cast_nullable_to_non_nullable
              as double,
      scorePace: scorePace == freezed
          ? _value.scorePace
          : scorePace // ignore: cast_nullable_to_non_nullable
              as String,
      nextScorePace: nextScorePace == freezed
          ? _value.nextScorePace
          : nextScorePace // ignore: cast_nullable_to_non_nullable
              as String,
      prevScore: prevScore == freezed
          ? _value.prevScore
          : prevScore // ignore: cast_nullable_to_non_nullable
              as int?,
      bestScore: bestScore == freezed
          ? _value.bestScore
          : bestScore // ignore: cast_nullable_to_non_nullable
              as int?,
      clearType: clearType == freezed
          ? _value.clearType
          : clearType // ignore: cast_nullable_to_non_nullable
              as String,
      misscount: misscount == freezed
          ? _value.misscount
          : misscount // ignore: cast_nullable_to_non_nullable
              as int?,
      prevMisscount: prevMisscount == freezed
          ? _value.prevMisscount
          : prevMisscount // ignore: cast_nullable_to_non_nullable
              as int?,
      bestMisscount: bestMisscount == freezed
          ? _value.bestMisscount
          : bestMisscount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$ScoreDataCopyWith<$Res> implements $ScoreDataCopyWith<$Res> {
  factory _$ScoreDataCopyWith(
          _ScoreData value, $Res Function(_ScoreData) then) =
      __$ScoreDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {int chartId,
      String title,
      int level,
      String difficulty,
      int modeType,
      int score,
      String djLevel,
      double scoreRate,
      String scorePace,
      String nextScorePace,
      int? prevScore,
      int? bestScore,
      String clearType,
      int? misscount,
      int? prevMisscount,
      int? bestMisscount});
}

/// @nodoc
class __$ScoreDataCopyWithImpl<$Res> extends _$ScoreDataCopyWithImpl<$Res>
    implements _$ScoreDataCopyWith<$Res> {
  __$ScoreDataCopyWithImpl(_ScoreData _value, $Res Function(_ScoreData) _then)
      : super(_value, (v) => _then(v as _ScoreData));

  @override
  _ScoreData get _value => super._value as _ScoreData;

  @override
  $Res call({
    Object? chartId = freezed,
    Object? title = freezed,
    Object? level = freezed,
    Object? difficulty = freezed,
    Object? modeType = freezed,
    Object? score = freezed,
    Object? djLevel = freezed,
    Object? scoreRate = freezed,
    Object? scorePace = freezed,
    Object? nextScorePace = freezed,
    Object? prevScore = freezed,
    Object? bestScore = freezed,
    Object? clearType = freezed,
    Object? misscount = freezed,
    Object? prevMisscount = freezed,
    Object? bestMisscount = freezed,
  }) {
    return _then(_ScoreData(
      chartId == freezed
          ? _value.chartId
          : chartId // ignore: cast_nullable_to_non_nullable
              as int,
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      difficulty == freezed
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      modeType == freezed
          ? _value.modeType
          : modeType // ignore: cast_nullable_to_non_nullable
              as int,
      score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      djLevel == freezed
          ? _value.djLevel
          : djLevel // ignore: cast_nullable_to_non_nullable
              as String,
      scoreRate == freezed
          ? _value.scoreRate
          : scoreRate // ignore: cast_nullable_to_non_nullable
              as double,
      scorePace == freezed
          ? _value.scorePace
          : scorePace // ignore: cast_nullable_to_non_nullable
              as String,
      nextScorePace == freezed
          ? _value.nextScorePace
          : nextScorePace // ignore: cast_nullable_to_non_nullable
              as String,
      prevScore == freezed
          ? _value.prevScore
          : prevScore // ignore: cast_nullable_to_non_nullable
              as int?,
      bestScore == freezed
          ? _value.bestScore
          : bestScore // ignore: cast_nullable_to_non_nullable
              as int?,
      clearType == freezed
          ? _value.clearType
          : clearType // ignore: cast_nullable_to_non_nullable
              as String,
      misscount == freezed
          ? _value.misscount
          : misscount // ignore: cast_nullable_to_non_nullable
              as int?,
      prevMisscount == freezed
          ? _value.prevMisscount
          : prevMisscount // ignore: cast_nullable_to_non_nullable
              as int?,
      bestMisscount == freezed
          ? _value.bestMisscount
          : bestMisscount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScoreData implements _ScoreData {
  _$_ScoreData(
      this.chartId,
      this.title,
      this.level,
      this.difficulty,
      this.modeType,
      this.score,
      this.djLevel,
      this.scoreRate,
      this.scorePace,
      this.nextScorePace,
      this.prevScore,
      this.bestScore,
      this.clearType,
      this.misscount,
      this.prevMisscount,
      this.bestMisscount);

  factory _$_ScoreData.fromJson(Map<String, dynamic> json) =>
      _$$_ScoreDataFromJson(json);

  @override
  final int chartId;
  @override
  final String title;
  @override
  final int level;
  @override
  final String difficulty;
  @override
  final int modeType;
  @override
  final int score;
  @override
  final String djLevel;
  @override
  final double scoreRate;
  @override
  final String scorePace;
  @override
  final String nextScorePace;
  @override
  final int? prevScore;
  @override
  final int? bestScore;
  @override
  final String clearType;
  @override
  final int? misscount;
  @override
  final int? prevMisscount;
  @override
  final int? bestMisscount;

  @override
  String toString() {
    return 'ScoreData(chartId: $chartId, title: $title, level: $level, difficulty: $difficulty, modeType: $modeType, score: $score, djLevel: $djLevel, scoreRate: $scoreRate, scorePace: $scorePace, nextScorePace: $nextScorePace, prevScore: $prevScore, bestScore: $bestScore, clearType: $clearType, misscount: $misscount, prevMisscount: $prevMisscount, bestMisscount: $bestMisscount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScoreData &&
            (identical(other.chartId, chartId) || other.chartId == chartId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.modeType, modeType) ||
                other.modeType == modeType) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.djLevel, djLevel) || other.djLevel == djLevel) &&
            (identical(other.scoreRate, scoreRate) ||
                other.scoreRate == scoreRate) &&
            (identical(other.scorePace, scorePace) ||
                other.scorePace == scorePace) &&
            (identical(other.nextScorePace, nextScorePace) ||
                other.nextScorePace == nextScorePace) &&
            (identical(other.prevScore, prevScore) ||
                other.prevScore == prevScore) &&
            (identical(other.bestScore, bestScore) ||
                other.bestScore == bestScore) &&
            (identical(other.clearType, clearType) ||
                other.clearType == clearType) &&
            (identical(other.misscount, misscount) ||
                other.misscount == misscount) &&
            (identical(other.prevMisscount, prevMisscount) ||
                other.prevMisscount == prevMisscount) &&
            (identical(other.bestMisscount, bestMisscount) ||
                other.bestMisscount == bestMisscount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      chartId,
      title,
      level,
      difficulty,
      modeType,
      score,
      djLevel,
      scoreRate,
      scorePace,
      nextScorePace,
      prevScore,
      bestScore,
      clearType,
      misscount,
      prevMisscount,
      bestMisscount);

  @JsonKey(ignore: true)
  @override
  _$ScoreDataCopyWith<_ScoreData> get copyWith =>
      __$ScoreDataCopyWithImpl<_ScoreData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScoreDataToJson(this);
  }
}

abstract class _ScoreData implements ScoreData {
  factory _ScoreData(
      int chartId,
      String title,
      int level,
      String difficulty,
      int modeType,
      int score,
      String djLevel,
      double scoreRate,
      String scorePace,
      String nextScorePace,
      int? prevScore,
      int? bestScore,
      String clearType,
      int? misscount,
      int? prevMisscount,
      int? bestMisscount) = _$_ScoreData;

  factory _ScoreData.fromJson(Map<String, dynamic> json) =
      _$_ScoreData.fromJson;

  @override
  int get chartId;
  @override
  String get title;
  @override
  int get level;
  @override
  String get difficulty;
  @override
  int get modeType;
  @override
  int get score;
  @override
  String get djLevel;
  @override
  double get scoreRate;
  @override
  String get scorePace;
  @override
  String get nextScorePace;
  @override
  int? get prevScore;
  @override
  int? get bestScore;
  @override
  String get clearType;
  @override
  int? get misscount;
  @override
  int? get prevMisscount;
  @override
  int? get bestMisscount;
  @override
  @JsonKey(ignore: true)
  _$ScoreDataCopyWith<_ScoreData> get copyWith =>
      throw _privateConstructorUsedError;
}
