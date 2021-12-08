enum SortOrder { asc, desc }

extension SortOrderExt on SortOrder {
  String get text {
    switch (this) {
      case SortOrder.asc:
        return '昇順';
      case SortOrder.desc:
        return '降順';
      default:
        return '';
    }
  }

  int get index {
    switch (this) {
      case SortOrder.asc:
        return 0;
      case SortOrder.desc:
        return 1;
      default:
        return 0;
    }
  }
}
