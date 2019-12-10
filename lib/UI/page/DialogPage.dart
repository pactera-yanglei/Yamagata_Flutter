import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                Row(
                  children: <Widget>[
                   OutlineButton(
                          color: Colors.black12,
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    'いいえ',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 16.0),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    '(ネットバンク申込みへ)',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 10.0),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () {
                            print("2");
                          }),
                 OutlineButton(
                          color: Colors.black12,

                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    'はい',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 16.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    '(次にすすむ)',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 10.0),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () {
                            print("2");
                          }),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
