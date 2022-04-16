import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

final logger = Logger('MyLogger');

// 別インスタンスのロガーを作ることもできる
final logger2 = Logger('MyLogger2');

void main() {
  // リリースビルドは出力しない、デバッグビルドはすべてログ出力する
  Logger.root.level = kReleaseMode ? Level.OFF : Level.ALL;

  // ログ出力内容を定義する（実装必須）
  Logger.root.onRecord.listen((LogRecord rec) {
    print('[${rec.loggerName}] ${rec.level.name}: ${rec.time}: ${rec.message}');
    if (rec.level >= Level.SEVERE) {
      // 致命的なエラーが発生したのでAssertionErrorをthrowしてStackTraceを表示する
      throw AssertionError('View stack trace by logger');
    }
  });

  logger.info('Hello logger!');
  logger2.info('ロガーを切り替えることが出来ます。');
  logger.severe(Exception('例外を投げてみる'));
  logger.info('処理は止まらない');
}
