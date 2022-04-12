import 'dart:developer' as developer;

final logger = Develogger();

class Develogger {
  void log(Object? message) {
    String msg;
    if (message is Function()) {
      msg = message().toString();
    } else if (message is String) {
      msg = message;
    } else {
      msg = message.toString();
    }
    developer.log(msg, name: 'Develogger');
  }
}

void main() {
  // ログレベル
  logger.log('Hello finer!');

  // 型
  logger.log(1000);
  logger.log(true);
  logger.log([1, 2, 3]);
  logger.log({'key': 'key', 'value': 'value'});
  logger.log(Exception('例外もいけます'));
  logger.log(() => '関数もいけます');
}
