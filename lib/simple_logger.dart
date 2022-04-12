import 'package:flutter/foundation.dart';
import 'package:simple_logger/simple_logger.dart';

final simpleLogger = SimpleLogger()
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
