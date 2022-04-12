import 'package:logging/logging.dart';

final logger = Logger('MyLogger');

void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });

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
