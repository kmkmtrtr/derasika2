import 'package:derasika2/data/model/score_data.dart';

abstract class Filter<T> {
  Filter(this.use, this.condition);

  final bool use;
  final T condition;

  bool Function(ScoreData) get filter;
}
