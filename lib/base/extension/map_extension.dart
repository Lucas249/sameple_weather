extension NullOrEmptyMapEx on Map? {
  bool get isNullOrEmpty => !isNotNullOrEmpty;

  bool get isNotNullOrEmpty => this?.isNotEmpty ?? false;
}