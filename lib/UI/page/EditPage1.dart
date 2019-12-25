import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'BookMarksPage.dart';

//UserInfo
class UserInfo {
  String Title;
  String subTitle;
  String money;
  int Id;
  bool isSelect;
  UserInfo({this.Title, this.subTitle,this.money,this.Id, this.isSelect = false});
  @override
  String toString() {
    // TODO: implement toString
    return Title + ','+subTitle+','+money+','+ '$Id' + ',' + '$isSelect';
  }
}

class EditWidget1 extends StatefulWidget {
  @override
  _EditWidgetState createState() => _EditWidgetState();
}

class _EditWidgetState extends State<EditWidget1> {
  List<UserInfo> userMapList = new List(); //自定义数据
  List<UserInfo> list1 = []; //接数据定义的list
  String _dbName = 'user.db2'; //数据库名称
  int _dbVersion = 1; //数据库版本
  String _createTableSQL =
      'CREATE TABLE student_table (id INTEGER PRIMARY KEY,userid TEXT, title TEXT,subtitle TEXT,bool ISSELECT,money TEXT)'; //创建表;
  List<UserInfo> YY; //存在db的数据
  @override
  void initState() {
    // TODO: implement initState
    addUser();
    //创建数据库，表
    _createDb(_dbName, _dbVersion, _createTableSQL);
    String sql = "SELECT * FROM student_table";
    YY = new List();
    _query(_dbName, sql);

    super.initState();
  }

  addUser() {
    for (int i = 0; i < listTitle.length; i++) {
      UserInfo u = new UserInfo();
      u.Id=i;
      u.Title=listTitle[i];
      u.subTitle=listSubTitle[i];
      u.money=listMoney[i];
      userMapList.add(u);
    }
  }
  List listTitle=[
    'SBL証券','JCBカード','セゾンカード','ビューカード','店島銀行','楽天証券','セゾンカード','JALマイレージバンク','楽天スーパーポイント','ANAマイレージクララ','Tポイントカード','Tポイントカード','ビューガード','Amazonポイント'
  ];
  List listSubTitle=[
    '現金残高等','【OS】JCBカード/プラスAMC','セゾンゴールド・アメリカン・エギ···','「ビュー・スイカ」カード','普通3015900','投資信託','代表口座105-6605283','残高別普通(統合)2126043','預り金',
    '永久不滅ポイント','JALマイル','楽天スーパーポイント','ANAマイル','Tポイント','期間固定Tポイント','ビューサンクスポイント','Amazonポイント'
  ];
  List listMoney=['1000','-14856','65562','46543','8461','-449971','6402','566','89496','-1966','84465','4894654','468984','-3500','7582','9878998','-46545'];
//  addUser(){
//    userMapList[0].Id=0;
//    userMapList[0].Title='SBL証券';
//    userMapList[0].subTitle='現金残高等';
//    userMapList[1].Id=1;
//    userMapList[1].Title='JCBカード';
//    userMapList[1].subTitle='【OS】JCBカード/プラスAMC';
//    userMapList[2].Id=2;
//    userMapList[2].Title='セゾンカード';
//    userMapList[2].subTitle='セゾンゴールド・アメリカン・エギ···';
//    userMapList[3].Id=3;
//    userMapList[3].Title='ビューカード';
//    userMapList[3].subTitle='「ビュー・スイカ」カード';
//    userMapList[4].Id=4;
//    userMapList[4].Title='店島銀行';
//    userMapList[4].subTitle='普通3015900';
//    userMapList[5].Id=5;
//    userMapList[5].Title='楽天証券';
//    userMapList[5].subTitle='投資信託';
//    userMapList[6].Id=6;
//    userMapList[6].Title='住信SBLネット銀行';
//    userMapList[6].subTitle='代表口座105-6605283';
//    userMapList[7].Id=7;
//    userMapList[7].Title='三井住友銀行';
//    userMapList[7].subTitle='残高別普通(統合)2126043';
//    userMapList[8].Id=8;
//    userMapList[8].Title='楽天証券';
//    userMapList[8].subTitle='預り金';
//    userMapList[9].Id=9;
//    userMapList[9].Title='セゾンカード';
//    userMapList[9].subTitle='永久不滅ポイント';
//    userMapList[10].Id=10;
//    userMapList[10].Title='JALマイレージバンク';
//    userMapList[10].subTitle='JALマイル';
//    userMapList[11].Id=11;
//    userMapList[11].Title='楽天スーパーポイント';
//    userMapList[11].subTitle='楽天スーパーポイント';
//    userMapList[12].Id=12;
//    userMapList[12].Title='ANAマイレージクララ';
//    userMapList[12].subTitle='ANAマイル';
//    userMapList[13].Id=13;
//    userMapList[13].Title='Tポイントカード';
//    userMapList[13].subTitle='Tポイント';
//    userMapList[14].Id=14;
//    userMapList[14].Title='Tポイントカード';
//    userMapList[14].subTitle='期間固定Tポイント';
//    userMapList[15].Id=15;
//    userMapList[15].Title='ビューガード';
//    userMapList[15].subTitle='ビューサンクスポイント';
//    userMapList[16].Id=16;
//    userMapList[16].Title='Amazonポイント';
//    userMapList[16].subTitle='Amazonポイント';
//  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    //判断db是否有数据
    bool bl = SpUtil.getBool('Bl');
//    print(YY.length);
    if (YY.length == 0) {
      bl = true;
    }
//    print(bl);
    list1 = bl ? userMapList : YY;
//    print(YY.length);
    return Scaffold(
      appBar: new AppBar(
        leading: _leading(),
        actions: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 15.0),
              child: GestureDetector(
                onTap: () {
                  String sql1 = "DELETE FROM student_table";
                  _delete(_dbName, sql1);
                  for (int i = 0; i < list1.length; i++) {
//                    print(list1[i].toString());
                    List listdb = list1[i].toString().split(',');
//                  print(listdb);
                    String v1 = listdb[0];
                    String v2 = listdb[1];
                    String v3 = listdb[2];
                    String v4 = listdb[3];
                    String v5 = listdb[4];
                    String sql =
                        "INSERT INTO student_table(title,subtitle,money,userid,bool) VALUES('$v1','$v2','$v3','$v4','$v5')";
                    _add(_dbName, sql);
                  }
                  SpUtil.putBool('Bl', false);
                  Navigator.of(context).pop();
//                  Navigator.push(context, MaterialPageRoute(builder:(context){
//                    return BookMakesState();
//                  }));
                },
                child: Text(
                  '完了',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
              ))
        ],
        centerTitle: true,
        title: new Text(
          'お気に入り設定',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
        ),
      ),
      body: Container(
          child: ReorderableListView(
              children: list1
                  .map((UserInfo) => CheckboxListTile(
                        key: ObjectKey(UserInfo),
//                    leading: Container(
//                      child: GestureDetector(
//                        onTap: () {
//                          setState(() {
//                            blList[1] = !blList[1];
//                          });
//                        },
//                        child: Icon(blList[1] ? Icons.check_box : Icons
//                            .check_box_outline_blank, color: Colors.blue,),
//                      ),
//                    ),
                        value: UserInfo.isSelect,
                        title: Text(UserInfo.Title),
                        subtitle: Text(UserInfo.subTitle),
//                        activeColor: Colors.blue,
                        dense: true,
                        selected: true,
                        isThreeLine: false,
                        secondary: Icon(Icons.drag_handle),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (value) {
//                          print(value);
                          setState(() {
                            UserInfo.isSelect = value;
                          });
                        },
//                    trailing: Icon(Icons.drag_handle),
                      ))
                  .toList(),
              onReorder: _onReorder)),
    );
  }

  _onReorder(int oldIndex, int newIndex) {
//    print('oldIndex: $oldIndex , newIndex: $newIndex');
    setState(() {
      if (newIndex == list1.length) {
        newIndex = list1.length - 1;
      }
      var item = list1.removeAt(oldIndex);
      list1.insert(newIndex, item);
    });
  }

  _leading() {
    Container(
      child: Text(
        'キャンセル',
        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
      ),
    );
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
    print("创建数据库成功");
  }
//  ///创建数据库db
//  _createDb(String dbName, int vers, String dbTables) async {
//    //获取数据库路径
//    var databasesPath = await getDatabasesPath();
//    String path = join(databasesPath, dbName);
////    print("数据库路径：$path数据库版本$vers");
//    //打开数据库
//    await openDatabase(path, version: vers,
//        onUpgrade: (Database db, int oldVersion, int newVersion) async {
//      //数据库升级,只回调一次
////      print("数据库需要升级！旧版：$oldVersion,新版：$newVersion");
//    }, onCreate: (Database db, int vers) async {
//      //创建表，只回调一次
//      await db.execute(dbTables);
//      await db.close();
//    });
//  }

  ///增
  _add(String dbName, String sql) async {
    //获取数据库路径
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);
//    print("数据库路径：$path");

    Database db = await openDatabase(path);
    await db.transaction((txn) async {
      int count = await txn.rawInsert(sql);
    });
//    await db.close();
//    setState(() {
////      _data = "插入数据成功！";
//    });
  }

  ///删
  _delete(String dbName, String sql) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);

    Database db = await openDatabase(path);
    int count = await db.rawDelete(sql);
//    await db.close();

//    if (count > 0) {
//      setState(() {
//        _data = "执行删除操作完成，该sql删除条件下的数目为：$count";
//      });
//    } else {
//      setState(() {
//        _data = "无法执行删除操作，该sql删除条件下的数目为：$count";
//      });
//    }
  }

  ///查全部
  _query(String dbName, String sql) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);

    Database db = await openDatabase(path);
    List<Map> list = await db.rawQuery(sql);
//    setState(() {
//
//    });
    for (int i = 0; i < list.length; i++) {
      UserInfo info = new UserInfo();
      info.Id = list[i]['id'];
      info.Title = list[i]['title'];
      info.subTitle=list[i]['subtitle'];
      info.money=list[i]['money'];
      if (list[i]['bool'] == 'true') {
        info.isSelect = true;
      } else {
        info.isSelect = false;
      }
      YY.add(info);
    }
    setState(() {});

    await db.close();
  }
}
