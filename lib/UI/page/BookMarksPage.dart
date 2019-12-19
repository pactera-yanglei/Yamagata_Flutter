import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'EditPage1.dart';
import 'package:path/path.dart';

class BookMakesState extends StatefulWidget {
  @override
  _BookMakesStateState createState() => _BookMakesStateState();
}

class _BookMakesStateState extends State<BookMakesState> {
  List<UserInfo> YY1;
  String _dbName = 'user.db'; //数据库名称

//  Widget buildListData(BuildContext context, List<UserInfo> YY1, item) {
//    return new ListTile(
//      leading: Icon(Icons.attach_money),
//      title: new Text(
//        YY1[item].Name,
//        style: TextStyle(fontSize: 18),
//      ),
//      subtitle: new Text(
//        YY1[item].Id.toString(),
//      ),
//      trailing: new Icon(Icons.keyboard_arrow_right),
//      // 创建点击事件
//      onTap: () {
//        showDialog(
//          context: context,
//          builder: (BuildContext context) {
//            return new AlertDialog(
//              title: new Text(
//                'ListViewAlert',
//                style: new TextStyle(
//                  color: Colors.black54,
//                  fontSize: 18.0,
//                ),
//              ),
//              content: new Text('您选择的item内容为:$YY1[item].Name'),
//            );
//          },
//        );
//      },
//    );
//  }

  @override
  void initState() {
    // TODO: implement initState
    String sql = "SELECT * FROM student_table WHERE isSelect=true";
    YY1 = new List();
    _query(_dbName, sql);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      body: Container(
//        color: Colors.black12,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Column(
          children: <Widget>[
            Container(
              height: 20.0,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 12,
                    child: Text(
                      'お気に入り情報',
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EditWidget1();
                      }));
                    },
                    child: Text(
                      "編集",
                      style: TextStyle(fontSize: 12.0, color: Colors.blue),
                      textAlign: TextAlign.right,
                    ),
                  ))
                ],
              ),
            ),
            Divider(height: 1.0, indent: 0.0, color: Colors.black12),
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemBuilder: (context, item) {
//                  return buildListData(context, YY1, item);
                return Text ("text$item");
                },
//                itemCount: YY1.length,
              ),
            ),
          ],
        ),
      ),
    );
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
      YY1.add(info);
    }
    for(int i=0;i<YY1.length;i++){
      print(YY1[i]);
    }
    print('asdaf'+"dsd");
    setState(() {});

    await db.close();

  }
}
