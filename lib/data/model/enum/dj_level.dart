enum DjLevel {
  none,
  f,
  e,
  d,
  c,
  b,
  a,
  aa,
  aaa,
}

extension DjLevelExt on DjLevel {
  String get text {
    return name.toUpperCase();
  }

  int get id {
    return index + 1;
  }
}
