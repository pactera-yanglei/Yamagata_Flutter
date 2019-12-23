import 'package:flutter/material.dart';

import 'DialogPage.dart';
import 'WheelPlantingPage.dart';

class BalancePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _BalancePagePage();
  }
}

class _BalancePagePage extends State<BalancePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return new Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            color: Colors.black12,
            child: Column(
              children: <Widget>[
                Container(
                  height: (MediaQuery.of(context).size.height - 265.0) / 2,
                  width: MediaQuery.of(context).size.width - 20.0,
                  padding: EdgeInsets.all(2.0),
                  color: Colors.white,
                  child: Image.asset('images/2.0x/balance_default.png'),
                ),
                Container(
                  height: (MediaQuery.of(context).size.height - 200.0) / 4,
                  width: MediaQuery.of(context).size.width - 20.0,
                  color: Colors.white,
                  child: Text(
                    '個人資産管理アプリ「 Moneytree」との連携で、\n山形銀行のロ座はもちるん、その他銀行や\nクレジットカード、ポイントサービスの残高や明細が\nかんたんに確認できます。',
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: (MediaQuery.of(context).size.height - 200.0) / 12,
                  width: MediaQuery.of(context).size.width - 20.0,
                  color: Colors.white,
                  child: Image.asset('images/2.0x/logo_momeytree.png'),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20.0,
                  height: (MediaQuery.of(context).size.height - 200.0) / 12,
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    child: MaterialButton(
                        elevation: 0,
                        color: Colors.blue,
                        child: Text(
                          'はじめての方はこちら',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return SplashPage();
                          }));
                        }),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20.0,
//                  height:(MediaQuery.of(context).size.height-200.0)/12,
                  color: Colors.white,
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
                            color: Colors.black12,
                            child: Text(
                              'Moneytreeアカウント設定',
                              style: TextStyle(color: Colors.blueAccent),
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
//                              Navigator.push(context, MaterialPageRoute(builder: (content){
//                                return DialogPage();
//                              }
//                              ));
                            DialogPage(context);
//                              DialogPage();
                            }),
//                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left:
                                MediaQuery.of(context).size.width * 0.95 - 65.0,
                            top: 6.0),
                        child: Image.asset('images/2.0x/moneytree_btn_blue.png'),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
