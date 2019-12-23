import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'BookMarksPage.dart';

//UserInfo
class UserInfo {
  String Name;
  int Id;
  bool isSelect;
  UserInfo({this.Name, this.Id, this.isSelect = false});
  @override
  String toString() {
    // TODO: implement toString
    return Name + ',' + '$Id' + ',' + '$isSelect';
  }
}

class EditWidget1 extends StatefulWidget {
  @override
  _EditWidgetState createState() => _EditWidgetState();
}

class _EditWidgetState extends State<EditWidget1> {
  List<UserInfo> userMapList = new List(); //自定义数据
  List<UserInfo> list1 = []; //接数据定义的list
  String _dbName = 'user.db'; //数据库名称
  int _dbVersion = 1; //数据库版本
  String _createTableSQL =
      'CREATE TABLE student_table (id INTEGER PRIMARY KEY, name TEXT,age INTEGER,bool ISSELECT)'; //创建表;
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
    for (int i = 0; i <= 8; i++) {
      UserInfo u = new UserInfo();
      u.Name = "A$i";
      u.Id = i;
      userMapList.add(u);
    }
  }

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
                    String sql =
                        "INSERT INTO student_table(name,age,bool) VALUES('$v1','$v2','$v3')";
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
                        title: Text(UserInfo.Name),
                        subtitle: Row(
                          children: <Widget>[Icon(Icons.perm_contact_calendar)],
                        ),
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
  }

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
      info.Name = list[i]['name'];
      if (list[i]['bool'] == 'true') {
        info.isSelect = true;
      } else {
        info.isSelect = false;
      }
      YY.add(info);
    }
    setState(() {});
//    for (int i = 0; i < YY.length; i++) {
//      print(YY[i]);
//    }
    await db.close();
//    YY.addAll(list);
//    return list;
  }
}
