import 'package:flutter/material.dart';
import 'package:yamagatabank_flutter/UI/DetailsPage/pull_up_load_listview.dart';


class SeisionCardState extends StatefulWidget {
  @override
  _SeisionCardStateState createState() => _SeisionCardStateState();
}
String title;
String user_account;
String user_money;
String refresh_time;
String search_key = "";
TextEditingController searchController = new TextEditingController();
PullUpLoadMoreList _pullUpLoadMoreList;
class _SeisionCardStateState extends State<SeisionCardState> {
  @override
  void initState() {
    // TODO: implement initState
    _pullUpLoadMoreList = new PullUpLoadMoreList("");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,//设置弹出软键盘Scaffold不重新绘制
      appBar: AppBar(
        elevation: 0,
        title: Text("セゾンカード"),
        centerTitle: true,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Text("閉じる"),
            ),
          )
        ],
      ),

      body: (Container(
//        decoration: BoxDecoration(
//          border: Border.all(color:Colors.red,width:1.0),
//        ),

        child: Column(
          children: <Widget>[
            Container(
              color:Colors.white,
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 10.0),
                        alignment: Alignment.center,
//                        color: Colors.red,
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Text(
                          'セゾンゴールド・ア···',
                          style: TextStyle(fontSize: 19.0),
                        ),
                      ),

                      Container(
//                        alignment: Alignment.center,
//                        color: Colors.blue,

                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Icon(
                                Icons.attach_money,
                                size: 30.0,
                              ),
                            ),
                            Expanded(
                              child: Icon(Icons.remove),
                            ),
                            Expanded(
                                flex: 4,
                                child: Text(
                                  "6,895",
                                  style: TextStyle(fontSize: 40.0),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Row(
                          children: <Widget>[
                            Expanded(flex: 2, child: Text('未確定')),
                            Expanded(flex: 1, child: Icon(Icons.attach_money)),
                            Expanded(flex: 1, child: Icon(Icons.remove)),
                            Expanded(
                              flex:2,
                              child: Text('9,432'),
                            )
                          ],
                        ),
                      ),
                      Container(

                        padding: EdgeInsets.only(left: 10.0),
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Row(
                          children: <Widget>[
                            Expanded(flex: 2, child: Text('確定')),
                            Expanded(child: Icon(Icons.attach_money)),
                            Expanded(child: Text('0'))
                          ],
                        ),
                      ),
                      Container(

                        padding: EdgeInsets.only(left: 10.0),
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Row(
                          children: <Widget>[
                            Expanded(flex: 2, child: Text('り术等')),
                            Expanded(child: Icon(Icons.attach_money)),
                            Expanded(child: Text('0'))
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              height:  MediaQuery.of(context).size.height * 0.71,
              width:  MediaQuery.of(context).size.width*0.9,
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  children: <Widget>[
                   Container(
                     alignment: Alignment.centerLeft,
                     height: MediaQuery.of(context).size.height * 0.1,
                     child: Text("取引明細",style: TextStyle(fontSize: 20.0),),
                   ),
                    Divider(),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),

                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width*0.82,
                      height: MediaQuery.of(context).size.height*0.07,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width:50.0,
                            height:50.0,
                          padding: EdgeInsets.only(left: 10.0,right: 10.0),
                            child: Image.asset("images/icon_search.png"),
                          ),
                          Expanded(
                              flex: 1,
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: "検索(例:金額、明細の名前)",border: InputBorder.none),
                                autocorrect: false,

                                ),
                              ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Expanded(
                        child: _pullUpLoadMoreList,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
