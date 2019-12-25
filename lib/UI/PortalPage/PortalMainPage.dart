import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yamagatabank_flutter/UI/DetailsPage/SeisonCardPage.dart';
import 'package:yamagatabank_flutter/UI/page/EditPage1.dart';
import 'package:yamagatabank_flutter/UI/portal/LoginWebView.dart';

import 'package:path/path.dart';

class PortalMain extends StatefulWidget {
  @override
  _PortalMainState createState() => _PortalMainState();
}

class _PortalMainState extends State<PortalMain> {
  List<UserInfo> YY1;
  String _dbName = 'user.db'; //数据库名称

  @override
  void initState() {
    // TODO: implement initState
    String sql = "SELECT * FROM student_table WHERE bool='true'";
    YY1 = new List();
    _query(_dbName, sql);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
              padding: EdgeInsets.only(top: 10.0),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Card(
                elevation: 0,
                child: ListView(
                  children: YY1
                      .map(
                        (UserInfo) => ListTile(
                      leading: Icon(Icons.attach_money),
                      title: Text(UserInfo.Title),
                      subtitle: Text(UserInfo.subTitle),
                      trailing:Icon(Icons.navigate_next),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return SeisionCardState();
                            }));
                        Divider(
                            height: 2.0,
                            indent: 0.0,
                            color: Colors.black12);
                      },
                    ),
                  )
                      .toList(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
//              width: MediaQuery.of(context).size.width ,
//              height: MediaQuery.of(context).size.height*0.04,
              child: Image.asset('images/logo_momeytree.png'),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 20.0,
//                  height:(MediaQuery.of(context).size.height-200.0)/12,
//              color: Colors.white,
              padding: EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 20.0,
                    height:
                    (MediaQuery.of(context).size.height - 200.0) / 12,
                    child: MaterialButton(
                        elevation: 0,
                        color: Colors.red,
                        child: Text(
                          '認証エラーまたは追加認証が必要',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (content){
                            return LoginWeb();
                          }
                          ));
//                          DialogPage(context);
//                              DialogPage();
                        }),
//                        ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left:
                        MediaQuery.of(context).size.width * 0.95 - 65.0,
                        top: 6.0),
                    child: Image.asset('images/2.0x/moneytree_btn_blue.png',color: Colors.white,),
                  )
                ],
              ),
            )
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
    for (int i = 0; i < list.length; i++) {
      UserInfo info = new UserInfo();
      info.Id = list[i]['id'];
      info.Title = list[i]['name'];
      if (list[i]['isselect'] == 'true') {
        info.isSelect = true;
      } else {
        info.isSelect = false;
      }
//      info.isSelect=list[i]['isselect'];
      YY1.add(info);
    }
    for (int i = 0; i < YY1.length; i++) {
      print(YY1[i]);
    }
    setState(() {});
    await db.close();
  }
}
