import 'package:logger/logger.dart';

final logger = Logger(
  filter: MyFilter(),
  printer: MyPrinter(),
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
