import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:simple_logger/simple_logger.dart';

final logger = SimpleLogger()
  ..formatter = (info) {
    // ログ出力内容をカスタマイズ
    return '[${info.level}] '
        '${DateFormat('HH:mm:ss.SSS').format(info.time)} '
        '[${info.callerFrame ?? 'caller info not available'}] '
        '${info.message}';
  }
  ..setLevel(
    // リリースビルドは出力しない、デバッグビルドはすべてログ出力する
    kReleaseMode ? Level.OFF : Level.ALL,
    // ログ出力した場所を出力する
    includeCallerInfo: true,
  )
  ..onLogged = (log, info) {
    if (info.level >= Level.SEVERE) {
      // 致命的なエラーが発生したのでAssertionで止めるとStackTraceも表示される
      throw AssertionError('Stopped by logger');
    }
  };

void main() {
  logger.info('Hello logger!');
  logger.severe(Exception('例外を投げてみる'));
}
