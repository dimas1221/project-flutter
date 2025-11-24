class InputConverter {
  static int toInt(dynamic value, {int fallback = 0}) {
    if (value == null) return fallback;
    if (value is int) return value;
    try {
      return int.parse(value.toString());
    } catch (_) {
      return fallback;
    }
  }

  static double toDouble(dynamic value, {double fallback = 0.0}) {
    try {
      return double.parse(value.toString());
    } catch (_) {
      return fallback;
    }
  }

  static DateTime? toDate(dynamic value) {
    if (value == null) return null;
    try {
      return DateTime.parse(value.toString());
    } catch (_) {
      return null;
    }
  }

  static String? toStringSafe(dynamic value) {
    if (value == null) return null;
    return value.toString();
  }
}
