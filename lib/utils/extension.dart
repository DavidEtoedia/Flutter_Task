extension NullExtension on dynamic {
  String valueOrNull() {
    if (this == null) {
      return "No Name";
    } else {
      return "$this";
    }
  }
}
