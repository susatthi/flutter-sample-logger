import 'dart:developer' as developer;

final develogger = Develogger();

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
