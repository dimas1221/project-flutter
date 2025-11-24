import 'package:flutter/foundation.dart';

class AppLogger {
  static void info(String message) {
    if (kDebugMode) {
      // ignore: avoid_print
      print("ℹ️ INFO: $message");
    }
  }

  static void error(String message, {Object? error, StackTrace? stack}) {
    if (kDebugMode) {
      // ignore: avoid_print
      print("⛔ ERROR: $message");
      if (error != null) print("👉 $error");
      if (stack != null) print(stack);
    }

    // (Optional) kirim log ke Firebase Crashlytics
    // FirebaseCrashlytics.instance.recordError(error, stack);
  }
}
