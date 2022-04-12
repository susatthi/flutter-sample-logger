import 'package:l/l.dart';

void main() {
  l.capture(
    someFunction,
    const LogOptions(
      handlePrint: true,
      printColors: true,
      outputInRelease: false,
      messageFormatting: _messageFormatting,
    ),
  );
  // ログレベル
  l.s('shout me');
  l.e('error msg');
  l.w('warning msg');
  l.i('info msg');
  l < 'alt info msg';
  l.d('debug msg');
  l << 'alt debug msg';
  l.v('verbose lvl #1');
  l.vv('verbose lvl #2');
  l.vvv('verbose lvl #3');
  l.v4('verbose lvl #4');
  l.v5('verbose lvl #5');
  l.v6('verbose lvl #6');
}

Future<void> someFunction() async {}

Object _messageFormatting(Object message, LogLevel logLevel, DateTime now) =>
    '${now.hour}:${now.minute.toString().padLeft(2, '0')} $message';
