import 'package:flutter/foundation.dart';
import 'package:simple_logger/simple_logger.dart';

final logger = SimpleLogger()
  ..setLevel(
    kReleaseMode ? Level.OFF : Level.ALL,
    // includeCallerInfo: true,
  )
  ..onLogged = (log, info) {
    if (info.level >= Level.SEVERE) {
      // 致命的なエラーが発生したのでデバッグ実行のときはAssertionErrorで止める
      // Crashlytics でログを飛ばすのもあり
      // throw AssertionError(log);
    }
  };

void main() {
  // ログレベル
  logger.finer('Hello finer!');
  logger.fine('Hello fine!');
  logger.config('Hello config!');
  logger.info('Hello info!');
  logger.warning('Hello warning!');
  logger.severe('Hello severe!');
  logger.shout('Hello shout!');

  // 型
  logger.info(1000);
  logger.info(true);
  logger.info([1, 2, 3]);
  logger.info({'key': 'key', 'value': 'value'});
  logger.info(Exception('例外もいけます'));
  logger.info(() => '関数もいけます');
}
