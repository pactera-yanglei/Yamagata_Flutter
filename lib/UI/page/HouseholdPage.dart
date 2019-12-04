import 'package:flutter/material.dart';

class BouseholdPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _BouseholdPage();
  }

}

class _BouseholdPage extends State<BouseholdPage> {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new Scaffold(
      body: ListView(
        children: <Widget>[
          Container(

            padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
            color: Colors.black12,
            child: Column(
              children: <Widget>[
                Container(
                  height:(MediaQuery.of(context).size.height-265.0)/2,
                  width:  MediaQuery.of(context).size.width-20.0,
                  padding: EdgeInsets.all(2.0),
                  color: Colors.white,
                  child: Image.asset('images/family_default.png'),
                ),
                Container(
                  height:(MediaQuery.of(context).size.height-200.0)/4,
                  width:  MediaQuery.of(context).size.width-20.0,
                  color: Colors.white,
                  child:Text('残高・取引照会で取得した明細を、\n住宅費や食費などのカテゴリ毎に自動で仕分け。\nグラフ表示で、月々の収支を\nかんたんに確認できます。',textAlign: TextAlign.center,) ,
                ),
                Container(
                  height:(MediaQuery.of(context).size.height-200.0)/12,
                  width:  MediaQuery.of(context).size.width-20.0,
                  color: Colors.white,
                  child: Image.asset('images/logo_momeytree.png'),
                ),
                Container(
                  width:  MediaQuery.of(context).size.width-20.0,
                  height:(MediaQuery.of(context).size.height-200.0)/12,
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 10.0,right: 10.0),
                  child: Container(
                    child: MaterialButton(
                        elevation: 0,
                        color: Colors.blue,
                        child: Text('はじめての方はこちら',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                        onPressed: () {
                          print("2");
                        }),
                  ),
                ),
                Container(
                  width:  MediaQuery.of(context).size.width-20.0,
//                  height:(MediaQuery.of(context).size.height-200.0)/12,
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 5.0,bottom: 5.0),
                  child:Stack(
                    children: <Widget>[
                      Container(
                        width:  MediaQuery.of(context).size.width-20.0,
                        height:(MediaQuery.of(context).size.height-200.0)/12,
                        child: MaterialButton(
                            elevation: 0,
                            color: Colors.black12,
                            child: Text('Moneytreeアカウント設定',style: TextStyle(color: Colors.blueAccent),textAlign: TextAlign.center,),
                            onPressed: () {
                              print("2");
                            }),
//                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.95-65.0,top: 6.0),
                        child: Image.asset('images/moneytree_btn_blue.png'),
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