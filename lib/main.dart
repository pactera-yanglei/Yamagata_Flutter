import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:yamagatabank_flutter/UI/MainTabWidget.dart';
import 'package:yamagatabank_flutter/UI/splash/progress_page.dart';
import 'package:yamagatabank_flutter/routers/application.dart';
import 'package:yamagatabank_flutter/routers/routers.dart';

void main() => runApp(MyApp());

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
