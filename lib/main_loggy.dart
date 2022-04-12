import 'package:loggy/loggy.dart';

final logger = Loggy('MyLogger');

void main() {
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(),
  );

  // ログレベル
  logger.debug('This is debug message');
  logger.info('This is info message');
  logger.warning('This is warning message');
  logger.error('This is error message');

  // 型
  logger.info(1000);
  logger.info(true);
  logger.info([1, 2, 3]);
  logger.info({'key': 'key', 'value': 'value'});
  logger.info(Exception('例外もいけます'));
  logger.info(() => '関数もいけます');

  // mixin
  SampleUi();
  SampleNetwork();
}

class SampleUi with UiLoggy {
  SampleUi() {
    loggy.debug('This is debug message');
    loggy.info('This is info message');
    loggy.warning('This is warning message');
    loggy.error('This is error message');
  }
}

class SampleNetwork with NetworkLoggy {
  SampleNetwork() {
    loggy.debug('This is debug message');
    loggy.info('This is info message');
    loggy.warning('This is warning message');
    loggy.error('This is error message');
  }
}
