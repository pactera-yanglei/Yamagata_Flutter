//import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

//import 'package:yamagatabank_flutter/UI/DetailsPage/SeisonCardPage.dart';
import 'package:yamagatabank_flutter/UI/portal/LoginWebView.dart';

//import 'package:yamagatabank_flutter/bean/kouzuoBean.dart';
import 'package:yamagatabank_flutter/res/colors.dart';
import 'EditPage1.dart';
//import 'package:path/path.dart';

class BookMakesState extends StatefulWidget {
  @override
  _BookMakesStateState createState() => _BookMakesStateState();
}

class _BookMakesStateState extends State<BookMakesState> {
  List<UserInfo> YY1;
  String _dbName = 'user.db2'; //数据库名称
//  List<KouzuoBean> list1 = new List();

  @override
  void initState() {
    // TODO: implement initState
    String sql = "SELECT * FROM student_table WHERE bool='true'";

    YY1 = new List();
    _query(_dbName, sql);
    for (int i = 0; i < YY1.length; i++) {
      print(YY1[i]);
    }
//    KouzuoBean bean = new KouzuoBean();
//    bean.current_balance = '1,000';
//    bean.display_name = '広島銀行';
//    bean.card_number = '3015900';
//    bean.show_name = '普通';
//    list1.add(bean);
//    KouzuoBean bean1 = new KouzuoBean();
//    bean1.current_balance = '15,466';
//    bean1.display_name = '住信SBIネット銀行';
//    bean1.card_number = '105-6605283';
//    bean1.show_name = '代表口座';
//    list1.add(bean1);
//    KouzuoBean bean2 = new KouzuoBean();
//    bean2.current_balance = '35,427';
//    bean2.display_name = '三井住友銀行';
//    bean2.card_number = '2126043';
//    bean2.show_name = '残高別普通(総合)';
//    list1.add(bean2);
//    KouzuoBean bean3 = new KouzuoBean();
//    bean3.current_balance='-774,190';
//    bean3.display_name='JCBカード';
//    bean3.card_number='3015900';
//    bean3.show_name='[OS]JCBカード/プラスAMC';
//    list1.add(bean3);
//    KouzuoBean bean4 = new KouzuoBean();
//    bean4.current_balance='-170,890';
//    bean4.display_name='ビューカード';
//    bean4.card_number='3015900';
//    bean4.show_name='「ビュー・スイカ」カード';
//    list1.add(bean4);
//    KouzuoBean bean5 = new KouzuoBean();
//    bean5.current_balance='-17,198';
//    bean5.display_name='セゾンカード';
//    bean5.card_number='3015900';
//    bean5.show_name='セゾンゴールド·アメリカン·工キ…';
//    list1.add(bean5);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void deactivate() {
    var b = ModalRoute.of(context).isCurrent;
    if (b) {
      String sql = "SELECT * FROM student_table WHERE bool='true'";
      YY1.clear();
      _query(_dbName, sql);
    }
    super.deactivate();
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
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10.0, left: 15),
                height: MediaQuery.of(context).size.height * 0.47,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Card(
                  elevation: 0,
//                child: ListView(
//                  children: YY1
//                      .map(
//                        (UserInfo) => ListTile(
//                      leading: Icon(Icons.attach_money),
//                      title: Text(UserInfo.Name),
//                      subtitle: Text(UserInfo.Name),
//                      trailing:Icon(Icons.navigate_next),
//                      onTap: () {
//                        Navigator.push(context,
//                            MaterialPageRoute(builder: (context) {
//                              return SeisionCardState();
//                            }));
//                        Divider(
//                            height: 2.0,
//                            indent: 0.0,
//                            color: Colors.black12);
//                      },
//                    ),
//                  )
//                      .toList(),
//                ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 30.0,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              child: Center(
                                child: Text(
                                  'お気に入り情報',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(child: Container()),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return EditWidget1();
                                    }));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Container(
                                      height: 30,
                                      child: Center(
                                        child: Text(
                                          "編集",
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.blue),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(height: 1.0, indent: 0.0, color: Colors.black12),
                      booklistItem(YY1)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
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
                    height: (MediaQuery.of(context).size.height - 200.0) / 12,
                    child: MaterialButton(
                        elevation: 0,
                        color: Colors.red,
                        child: Text(
                          '認証エラーまたは追加認証が必要',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (content) {
                            return LoginWeb();
                          }));
//                          DialogPage(context);
//                              DialogPage();
                        }),
//                        ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.95 - 65.0,
                        top: 6.0),
                    child: Image.asset(
                      'images/2.0x/moneytree_btn_blue.png',
                      color: Colors.white,
                    ),
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
    String path = databasesPath + '/' + dbName;
    Database db = await openDatabase(path);
    List<Map> list = await db.rawQuery(sql);
    for (int i = 0; i < list.length; i++) {
      UserInfo info = new UserInfo();
      info.Id = list[i]['id'];
      info.Title = list[i]['title'];
      info.subTitle = list[i]['subtitle'];
//      _formatNum('-449971');
//      info.money=list[i]['money'];
      info.money = _formatNum(list[i]['money']);
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

class booklistItem extends StatefulWidget {
  List<UserInfo> list = new List();

  booklistItem(this.list);

  @override
  booklistItemState createState() => new booklistItemState();
}

class booklistItemState extends State<booklistItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(left: 10.0, right: 10, top: 2),
              reverse: false,
              primary: true,
//        itemExtent: 50.0,
              shrinkWrap: true,
              itemCount: widget.list.length,
              cacheExtent: 30.0,
//        physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) => Container(
//        itemBuilder: (context,i)=>Container(
//          width: MediaQuery.of(context).size.width-40,
//          child: Padding(
//            padding: EdgeInsets.only(left: 10, right: 10),
//            child: Container(
//              child: Column(
//                children: <Widget>[
//                  Container(
//                    height: 40,
//                    color: Colours.color_e5e5e5,
//                    child: Row(
//                      children: <Widget>[
//                        SizedBox(
//                          width: 5,
//                        ),
//                        Column(
//                          children: <Widget>[
//                            Expanded(child: SizedBox()),
//                            Text(
//                              widget.list[i].display_name,
//                              style: TextStyle(
//                                  fontSize: 13,
//                                  fontFamily: 'Mainfonts',
//                                  color: Colours.color_666666),
//                            ),
//                            Expanded(child: SizedBox())
//                          ],
//                        ),
//                        Expanded(child: SizedBox())
//                      ],
//                    ),
//                  ),
//                  Container(
//                    color: Colours.color_fafafa,
//                    child: Column(
//                      children: <Widget>[
//                        SizedBox(height: 10),
//                        Row(
//                          children: <Widget>[
//                            SizedBox(
//                              width: 10,
//                            ),
//                            Column(
//                              children: <Widget>[
//                                Text(
//                                  widget.list[i].show_name,
//                                  style: TextStyle(
//                                      fontSize: 12,
////                                      fontFamily: 'Mainfonts',
//                                      color: Colours.color_666666),
//                                ),
//
//                              ],
//                            ),
//                            Expanded(child: Container(),flex: 1,),
//                            Text(
//                              '￥',
//                              style: TextStyle(
//                                  fontFamily: 'Mainfonts',
//                                  fontSize: 26,
//                                  color: Colours.color_666666),
//                            ),
////                        Expanded(child: SizedBox()),
//                            Text(
//                              widget.list[i].current_balance,
//                              style: TextStyle(
//                                fontFamily: 'Mainfonts',
//                                fontSize: 23,
//                                color: Colours.color_666666,
//                              ),
//                            ),
//                            SizedBox(
//                              width: 10,
//                              child: Container(),
//                            ),
//                            Image.asset(
//                              "images/retern_blue_little.png",
//                              width: 15,
//                              height: 15,
//                              fit: BoxFit.fill,
//                            ),
//                            SizedBox(
//                              width: 10,
//                              child: Container(),
//                            ),Row(
//                              children: <Widget>[
//
//                              ],
//                            ),
//                          ],
//                        ),
//                        SizedBox(height: 10),
//                      ],
//                    ),
//                  )
//                ],
//              ),
//            ),
//          ),
//        )
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  widget.list[i].Title,
                                  style: TextStyle(
                                      fontFamily: 'Mainfonts',
                                      fontSize: 15,
                                      color: Colours.color_666666),
                                ),
                                Expanded(child: SizedBox())
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '￥',
                                  style: TextStyle(
                                      fontFamily: 'Mainfonts',
                                      fontSize: 26,
                                      color: Colours.color_666666),
                                ),
                                Expanded(child: SizedBox()),
                                Text(
                                  widget.list[i].money,
                                  style: TextStyle(
                                    fontFamily: 'Mainfonts',
                                    fontSize: 30,
                                    color: Colours.color_666666,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                  child: Container(),
                                ),
                                Image.asset(
                                  "images/retern_blue_little.png",
                                  width: 15,
                                  height: 15,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 10,
                                  child: Container(),
                                ),
                              ],
                            ),
                            Container(
                              height: 1,
                              color: Colours.text_gray_c,
                            )
                          ],
                        ),
                      ),
                    ),
                  ))),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(booklistItem oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}

//金额千分化
String _formatNum(String num) {
  List<String> list = new List();
  int a = 0;
  if (num.length > 3) {
    for (int i = 3; i < num.length; i = i + 3) {
      if (i > num.length) {
        break;
      }
      String s =
          num.substring(num.length - ((a + 1) * 3), num.length - (a * 3));
      list.add(s);
      a++;
    }
  }
  String s = num.substring(0, num.length - (a * 3));
  list.add(s);
  String money = '';
  for (int i = list.length - 1; i >= 0; i--) {
    if (money.isEmpty) {
      money = list[i];
    } else {
      if (money == '-') {
        money = money + list[i];
      } else {
        money = money + ',' + list[i];
      }
    }
  }
  return money;
}
