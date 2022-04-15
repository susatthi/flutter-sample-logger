import 'package:logger/logger.dart';

// デフォルトでリリースビルドは出力しない、デバッグビルドはすべてログ出力する動作になっている
final logger = Logger();

void main() {
  logger.v('Hello logger!');
  logger.d(1000);
  logger.i(true);
  logger.w([1, 2, 3]);
  logger.e({'key': 'key', 'value': 'value'});
  logger.wtf(Exception('例外もいけます'));
  logger.i(() => '関数もいけます');
}
