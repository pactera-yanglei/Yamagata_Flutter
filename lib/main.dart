import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yamagatabank_flutter/UI/MainTabWidget.dart';
import 'package:yamagatabank_flutter/UI/splash/progress_page.dart';
import 'package:yamagatabank_flutter/routers/application.dart';
import 'package:yamagatabank_flutter/routers/routers.dart';
import 'package:yamagatabank_flutter/util/minefocus_base_flutter.dart';
import 'package:yamagatabank_flutter/webtest.dart';
import 'package:path/path.dart';

void main() async {

  await MinefocusBase.getInstance().init('https://yamagatabank-api-dev.scsk-api.minefocus.jp/');

    runApp(MyApp());

}

class MyApp extends StatelessWidget {
  MyApp() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YamagataDemo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'YamagataDemo Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'awabank',
        debugShowCheckedModeBanner:false,
        theme: ThemeData(primaryColor: Colors.white),
        home:ProgressPage());
}
}

