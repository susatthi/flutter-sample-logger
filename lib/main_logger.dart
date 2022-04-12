import 'package:logger/logger.dart';

final logger = Logger(
    // filter: MyFilter(),
    // printer: MyPrinter(),
    // printer: PrefixPrinter(PrettyPrinter(colors: false)),
    );

class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}

class MyPrinter extends LogPrinter {
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
    return [msg];
  }
}

void main() {
  // ログレベル
  logger.v('Hello verbose!');
  logger.d('Hello debug!');
  logger.i('Hello info!');
  logger.w('Hello warning!');
  logger.e('Hello error!');
  logger.wtf('Hello wtf!');

  // 型
  logger.i(1000);
  logger.i(true);
  logger.i([1, 2, 3]);
  logger.i({'key': 'key', 'value': 'value'});
  logger.i(Exception('例外もいけます'));
  logger.i(() => '関数もいけます');
}
