import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yamagatabank_flutter/UI/portal/LoginRuleWidget.dart';

void DialogPage(BuildContext context) {
  // TODO: implement build
  showDialog(
      context: context,
      builder: (context) {
        return new AlertDialog(
//        title: Image.asset('images/ic_info.png'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
//              Image.asset('ic_info.png'),
                SizedBox(
                  height: 30.0,
                  child: Container(),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.width * 0.15,
                  child: Image.asset('images/ic_info.png'),
                ),
                SizedBox(
                  height: 20.0,
                  child: Container(),
                ),
                new Text(
                  'お知らせ',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15.0,
                  child: Container(),
                ),
                new Text(
                  '「一生通帳 by Moneytree」のご利用\nにはくやまぎん〉インターネットバンキ\nングのご\n契約と初回利用登録が必要となります。',
                  style: TextStyle(fontSize: 13.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.0,
                  child: Container(),
                ),
                new Text(
                  'くやまぎん)インターネットバンキング\nの契約をお持ちのお客さまですか?',
                  style: TextStyle(fontSize: 13.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10.0,
                  child: Container(),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
//                      color:Colors.red,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      height: 40.0,
                      width: MediaQuery.of(context).size.width * 0.31,
                      child: MaterialButton(
                          elevation: 0,
                          color: Colors.black12,
                          child: Column(children: <Widget>[
                            Container(
                                child: Text(
                              'いいえ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600),
                            )),
                            Container(
                              child: Text(
                                '(ネットバンク申込みへ)',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 7.0),
                              ),
                            ),
                          ]),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () {
                            print("2");
                          }),
                    ),
                    Container(
                      width: 8.0,
                      child: Text(''),
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 1.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      height: 40.0,
                      width: MediaQuery.of(context).size.width * 0.31,
                      child: MaterialButton(
                          elevation: 0,
                          color: Colors.white12,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  child: Text(
                                'はい',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600),
                              )),
                              Container(
                                child: Text(
                                  '(次にすすむ)',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 7.0),
                                ),
                              ),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return  LoginRule();
                            }));
                          }),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
