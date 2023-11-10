extension NullOrEmptyStringEx on String? {
  bool get isNullOrEmpty => !isNotNullOrEmpty;

  bool get isNotNullOrEmpty => this?.isNotEmpty ?? false;
}
