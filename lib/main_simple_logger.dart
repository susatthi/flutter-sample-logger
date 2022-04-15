import 'package:simple_logger/simple_logger.dart';

final logger = SimpleLogger()
  ..setLevel(
    // すべてログ出力する
    Level.ALL,
    // ログ出力した場所を出力する
    includeCallerInfo: true,
  );

void main() {
  logger.finer('Hello logger!');
  logger.fine(1000);
  logger.config(true);
  logger.info([1, 2, 3]);
  logger.warning({'key': 'key', 'value': 'value'});
  logger.severe(Exception('例外もいけます'));
  logger.shout(() => '関数もいけます');
}
