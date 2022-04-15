import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

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

    // リリースビルドは出力しない、デバッグビルドは出力する
    if (!kReleaseMode) {
      developer.log(msg, name: 'Develogger');
    }
  }
}

void main() {
  logger.log('Hello logger!');
  logger.log(1000);
  logger.log(true);
  logger.log([1, 2, 3]);
  logger.log({'key': 'key', 'value': 'value'});
  logger.log(Exception('例外もいけます'));
  logger.log(() => '関数もいけます');
}
