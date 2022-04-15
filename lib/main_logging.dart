import 'package:logging/logging.dart';

final logger = Logger('MyLogger');

void main() {
  // すべてログ出力する
  Logger.root.level = Level.ALL;

  // ログ出力内容を定義する（実装必須）
  Logger.root.onRecord.listen((LogRecord rec) {
    print('[${rec.loggerName}] ${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  logger.finer('Hello logger!');
  logger.fine(1000);
  logger.config(true);
  logger.info([1, 2, 3]);
  logger.warning({'key': 'key', 'value': 'value'});
  logger.severe(Exception('例外もいけます'));
  logger.shout(() => '関数もいけます');
}
