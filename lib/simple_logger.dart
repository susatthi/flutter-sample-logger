import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:simple_logger/simple_logger.dart';

final simpleLogger = SimpleLogger()
  ..formatter = (info) {
    return '[${info.level}] '
        '${DateFormat('HH:mm:ss.SSS').format(info.time)} '
        '[${info.callerFrame ?? 'caller info not available'}] '
        '${info.message}';
  }
  ..setLevel(
    kReleaseMode ? Level.OFF : Level.ALL,
    includeCallerInfo: true,
  )
  ..onLogged = (log, info) {
    if (info.level >= Level.SEVERE) {
      // 致命的なエラーが発生したのでデバッグ実行のときはAssertionErrorで止める
      // Crashlysticsでログを飛ばすのもあり
      throw AssertionError(log);
    }
  };
