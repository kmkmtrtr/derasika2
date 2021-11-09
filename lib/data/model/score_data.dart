class ScoreData {
  final int chartId;
  final String title;
  final int level;
  final String difficulty;
  final int modeType;
  final int score;
  final String djLevel;
  final double scoreRate;
  final String scorePace;
  final String nextScorePace;
  final int? prevScore;
  final int? bestScore;
  final String clearType;
  final String misscount;
  late int _misscountValue;
  int get misscountValue {
    return _misscountValue;
  }

  final String? prevMisscount;
  late int _prevMisscountValue;
  int get prevMisscountValue {
    return _prevMisscountValue;
  }

  final String? bestMisscount;
  late int _bestMisscountValue;
  int get bestMisscountValue {
    return _bestMisscountValue;
  }

  ScoreData(
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
    this.bestMisscount,
  ) {
    final misscountValue = int.tryParse(misscount) ?? -1;
    _misscountValue = misscountValue;
    final prevMisscountValue = int.tryParse(prevMisscount ?? '---') ?? -1;
    _prevMisscountValue = prevMisscountValue;
    final bestMisscountValue = int.tryParse(bestMisscount ?? '---') ?? -1;
    _bestMisscountValue = bestMisscountValue;
  }

  factory ScoreData.fromMap(Map<String, dynamic> data) {
    return ScoreData(
      data['chart_id'],
      data['title'],
      data['level'],
      data['difficulty'],
      data['mode_type_id'],
      data['score'],
      data['djlevel_type'],
      data['score_rate'],
      data['score_pace'],
      data['next_score_pace'],
      data['prev_score'],
      data['best_score'],
      data['clear_type'],
      data['misscount'].toString(),
      data['prev_misscount']?.toString(),
      data['best_misscount']?.toString(),
    );
  }
}
