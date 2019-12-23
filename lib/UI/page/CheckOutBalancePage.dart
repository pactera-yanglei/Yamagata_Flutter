import 'package:flutter/material.dart';
import 'package:yamagatabank_flutter/UI/AssetsPage/AssetsMainPage.dart';
import 'package:yamagatabank_flutter/UI/page/HouseholdPage.dart';
import 'package:yamagatabank_flutter/UI/page/CashPage.dart';

import 'BookMarksPage.dart';



class CheckOutBalanceState extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _CheckOutBalanceStateState createState() => _CheckOutBalanceStateState();
}

class _CheckOutBalanceStateState extends State<CheckOutBalanceState> {
  @override
  Widget build(BuildContext context) {
    //一个控件，可以监听返回键
    return Container(
      child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: TabBar(
                tabs: <Widget>[
                  Tab(text: "お気に入り"),
                  Tab(text:"資産"),
                  Tab(text: "ポイント"),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                Container(
                  child:new BookMakesState(),
                ),
                Container(
                  child:new AssetsMainPage(),
                ),
                Container(
                  child:new CashPage(),
                )
              ],
            ),
          )
      ),
    );
  }

}

