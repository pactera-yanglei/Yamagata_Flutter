import 'package:flutter/material.dart';

import 'LoginRuleWebViewPage.dart';
import 'LoginWebView.dart';

class LoginRule extends StatefulWidget {
  @override
  _LoginRuleState createState() => _LoginRuleState();
}

class _LoginRuleState extends State<LoginRule> {
  bool state =false;
  Future _loadUserInfo() async{
    setState(() {
      state=true;
    });
  }
  @override
  void deactivate() {
    // TODO: implement deactivate
    var b = ModalRoute.of(context).isCurrent;
    print(b);
    if(b){
      _loadUserInfo();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(

        appBar: AppBar(
          centerTitle: true,
          title: Text('一生通帐by moneytree'),
          leading: Container(child: Text(''),),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child:GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text("閉じる",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600),),
              ),
            )

          ],
        ),
        body: Container(
          color: Colors.black12,
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.78,
//                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 20.0),
                      alignment: Alignment.center,
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height * 0.4,
//                      width: MediaQuery.of(context).size.width*0.9,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 20.0),
//                            width: MediaQuery.of(context).size.width*0.8,
                            height: MediaQuery.of(context).size.height * 0.09,
                            child: Image.asset('images/by_moneytree.png'),
                          ),
                          Container(
                            child: Text(
                              '「ー生通帳 by Moneytree」は、「やまぎんアプ\nリE- Branchとマネーツリー株式'
                              '会社が提供\nする個人資産管理アプリ「 Moneytreeを連携す\nることで、「やまぎんアプ'
                              'リE- Brancから\n「 Moneytree」に登録した銀行や証差会社の口\n座、クレジットカード、ボイン'
                              'トサービスなど\nの残高や利用明細を照会できるサビスです。',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
//                      color: Colors.red,
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.5,
//                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: Image.asset("images/logo_2.png"),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: Image.asset("images/logo_1.png"),
                                )
                              ],
                            ),
                          ),
                          Container(
                              padding:
                                  EdgeInsets.only(left: 25.0, bottom: 10.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '「ご利用方法」',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              )),
                          Container(
                            child: Text('①「 Moneytree」でアカウント(無料)を登録する。'),
                          ),
                          Container(
                              child: Text('②「Tmoneytree」に山形銀行の口座を登録する(無\n料)。')),
                          Container(
                            padding: EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                  '③「やまぎんアプリE- Branch」と「 Moneytree」の\n連携を許可する。')),
                          Container(
                            width:  MediaQuery.of(context).size.width * 0.85,
                            height: 50.0,
                            decoration: BoxDecoration(
                              border: Border.all(color: state?Colors.blueAccent:Colors.white,width: 1.0),
                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                            ),
                            alignment: Alignment.center,
//                            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: MaterialButton(
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.85,
                              height: 50.0,
                              elevation: 0,
                              color:state?Colors.black26:Colors.red,
                              child: Text(
                                '注意事項を確認する',
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (content) {
                                  return LoginRuleWebViewPage();
                                }));
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10.0),
                              child: Text(
                            '※上記の内容および注意事項にご同意の上、下記「利用\nする」'
                            'をタップしてください(注意事項をご確認いただく\nことでタップ可能になります)。',
                            textAlign: TextAlign.center,
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 4.0,),
                height: MediaQuery.of(context).size.height * 0.09,
                alignment: Alignment.center,
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width * 0.9,
                  height: 50.0,
                  elevation: 0,
                  color: state?Colors.blue:Colors.black26,
                  child: Text(
                    '利用する',
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  onPressed: state?_statePressed:_pressed,
                ),
              )
            ],
          ),
        )
    );

  }
  void _pressed(){}
  void _statePressed(){
    Navigator.push(context,
        MaterialPageRoute(builder: (content) {
          return LoginWeb();
        }));
  }
}
