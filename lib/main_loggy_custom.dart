import 'package:flutter/foundation.dart';
import 'package:loggy/loggy.dart';

final logger = Loggy('MyLogger');

/// Crashlyticsにエラーを送信するプリンター
class CrashlyticsPrinter extends LoggyPrinter {
  const CrashlyticsPrinter() : super();

  @override
  void onLog(LogRecord record) {
    if (record.level.priority >= LogLevel.error.priority) {
      // Crashlyticsにエラーを送信する例
      // FirebaseCrashlytics.instance.log(record.message);
      // FirebaseCrashlytics.instance.recordError(record.error, record.stackTrace);
    }
  }
}

void main() {
  Loggy.initLoggy(
    // リリースビルドは出力せずに Crashlytics にエラーを送信し、デバッグビルドはログ出力する
    logPrinter:
        kReleaseMode ? const CrashlyticsPrinter() : const PrettyPrinter(),
    logOptions: const LogOptions(
      // すべてのログを出力する
      LogLevel.all,
      // エラーの場合はスタックトレースも出力する
      stackTraceLevel: LogLevel.error,
      // ログ出力した場所を出力する
      includeCallerInfo: true,
    ),
  );

  logger.info('Hello logger!');
  logger.error(Exception('例外を投げてみる'));
}
