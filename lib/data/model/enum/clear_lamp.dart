enum ClearLamp {
  noplay,
  assisteasy,
  easyclear,
  clear,
  hardclear,
  exhardclear,
  fullcombo,
}

extension ClearLampExt on ClearLamp {
  String get text {
    switch (this) {
      case ClearLamp.noplay:
        return 'NO PLAY';
      case ClearLamp.assisteasy:
        return 'ASSIST EASY';
      case ClearLamp.easyclear:
        return 'EASY CLEAR';
      case ClearLamp.clear:
        return 'CLEAR';
      case ClearLamp.hardclear:
        return 'HARD CLEAR';
      case ClearLamp.exhardclear:
        return 'EX HARD CLEAR';
      case ClearLamp.fullcombo:
        return 'FULLCOMBO';
      default:
        return '';
    }
  }
}
