import 'package:flutter/material.dart';
import 'package:flutter_sample_logger/logger.dart';
import 'package:flutter_sample_logger/logging.dart';
import 'package:flutter_sample_logger/simple_logger.dart';
import 'package:logging/logging.dart' as logging_package;

void main() {
  logging_package.Logger.root.level = logging_package.Level.ALL;
  logging_package.Logger.root.onRecord.listen((logging_package.LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // simple_logger

    // ログレベル
    simpleLogger.finer('Hello finer!');
    simpleLogger.fine('Hello fine!');
    simpleLogger.config('Hello config!');
    simpleLogger.info('Hello info!');
    simpleLogger.warning('Hello warning!');
    simpleLogger.severe('Hello severe!');
    simpleLogger.shout('Hello shout!');

    // 型
    simpleLogger.info(1000);
    simpleLogger.info(true);
    simpleLogger.info([1, 2, 3]);
    simpleLogger.info({'key': 'key', 'value': 'value'});
    simpleLogger.info(Exception('例外もいけます'));
    simpleLogger.info(() => '関数もいけます');

    // logger
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

    // logging
    logging.finer('Hello finer!');
    logging.fine('Hello fine!');
    logging.config('Hello config!');
    logging.info('Hello info!');
    logging.warning('Hello warning!');
    logging.severe('Hello severe!');
    logging.shout('Hello shout!');

    // 型
    logging.info(1000);
    logging.info(true);
    logging.info([1, 2, 3]);
    logging.info({'key': 'key', 'value': 'value'});
    logging.info(Exception('例外もいけます'));
    logging.info(() => '関数もいけます');

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
