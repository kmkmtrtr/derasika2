enum SortElement {
  title,
  level,
  difficulty,
  scoreRate,
  clearType,
  djPoint,
  maxBpm,
  notes,
  version,
  prevScoreDiff,
  bestScoreDiff,
  targetScoreDiff,
}

extension SortElementExt on SortElement {
  String get text {
    switch (this) {
      case SortElement.title:
        return '曲名';
      case SortElement.level:
        return 'レベル';
      case SortElement.difficulty:
        return '難易度';
      case SortElement.scoreRate:
        return 'スコアレート';
      case SortElement.clearType:
        return 'クリアランプ';
      case SortElement.djPoint:
        return 'DJ Point';
      case SortElement.maxBpm:
        return '最大BPM';
      case SortElement.notes:
        return '総ノーツ数';
      case SortElement.version:
        return 'バージョン';
      case SortElement.prevScoreDiff:
        return '前作スコア比';
      case SortElement.bestScoreDiff:
        return '歴代スコア比';
      case SortElement.targetScoreDiff:
        return '目標スコア比';
      default:
        return '';
    }
  }
}
