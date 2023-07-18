class Common {
  static String dateTimeEncode(dynamic item) {
    if (item is DateTime) {
      return item.toIso8601String();
    }
    return item.toString();
  }

  static DateTime dateTimeDecode(dynamic item) {
    if (item is String) {
      return DateTime.parse(item);
    }
    return getCurrentDate();
  }

  static DateTime getCurrentDate({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
  }) {
    final dateNow = DateTime.now();
    return DateTime(
      year == null ? dateNow.year : year,
      month == null ? dateNow.month : month,
      day == null ? dateNow.day : day,
      hour == null ? dateNow.hour : hour,
      minute == null ? dateNow.minute : minute,
      second == null ? dateNow.second : second,
    );
  }
}
