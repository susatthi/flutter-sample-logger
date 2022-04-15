import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

final logger = Logger(
  // ログ出力内容をカスタマイズできる
  // あらかじめ用意されているPrettyPrinterをカスタマイズした例
  printer: PrettyPrinter(
      methodCount: 1, // 表示されるコールスタックの数
      errorMethodCount: 5, // 表示されるスタックトレースのコールスタックの数
      lineLength: 120, // 出力するログ1行の幅
      colors: true, // メッセージに色をつけるかどうか
      printEmojis: true, // 絵文字を出力するかどうか
      printTime: true // タイムスタンプを出力するかどうか
      ),
);

// 別インスタンスのロガーを作ることもできる
final logger2 = Logger(
  // ログ出力内容をシンプルにカスタマイズした例
  printer: MyLogPrinter(),

  // ログ出力したあとに処理を挿入する
  output: MyLogOutput(),
);

/// シンプルな出力
class MyLogPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    final message = event.message;

    String msg;
    if (message is Function()) {
      msg = message().toString();
    } else if (message is String) {
      msg = message;
    } else {
      msg = message.toString();
    }
    return [
      '[${event.level.name.toUpperCase()}] '
          '${DateFormat('HH:mm:ss.SSS').format(DateTime.now())}: '
          '$msg'
    ];
  }
}

/// 致命的なエラーが起きたときはAssertionで処理を止める
class MyLogOutput extends ConsoleOutput {
  @override
  void output(OutputEvent event) {
    super.output(event);
    if (event.level.index >= Level.error.index) {
      // 致命的なエラーが発生したのでAssertionで止めるとStackTraceも表示される
      throw AssertionError('Stopped by logger');
    }
  }
}

void main() {
  logger.i('Hello logger!');
  logger.w('Hello logger warning!', Exception('loggerの例外'), StackTrace.current);
  logger2.i('Hello logger!');
  logger2.e(Exception('例外を投げてみる'));
}
