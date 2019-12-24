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
  String _dbName = 'user.db1'; //数据库名称
  int _dbVersion = 1; //数据库版本
  String _createTableSQL =
      'CREATE TABLE student_table (id INTEGER PRIMARY KEY, name TEXT,age INTEGER,bool ISSELECT)'; //创建表;
  //创建数据库，表
  _createDb(_dbName, _dbVersion, _createTableSQL);
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

///创建数据库db
_createDb(String dbName, int vers, String dbTables) async {
  //获取数据库路径
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, dbName);
//    print("数据库路径：$path数据库版本$vers");
  //打开数据库
  await openDatabase(path, version: vers,
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        //数据库升级,只回调一次
//      print("数据库需要升级！旧版：$oldVersion,新版：$newVersion");
      }, onCreate: (Database db, int vers) async {
        //创建表，只回调一次
        await db.execute(dbTables);
        await db.close();
      });
}