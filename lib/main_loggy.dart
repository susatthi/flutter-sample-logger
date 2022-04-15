import 'package:loggy/loggy.dart';

final logger = Loggy('MyLogger');

void main() {
  Loggy.initLoggy();

  logger.debug('Hello logger!');
  logger.info(1000);
  logger.warning(true);
  logger.error([1, 2, 3]);
  logger.info({'key': 'key', 'value': 'value'});
  logger.info(Exception('例外もいけます'));
  logger.info(() => '関数もいけます');
}
