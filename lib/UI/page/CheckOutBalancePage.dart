import 'package:flutter/material.dart';
import 'package:yamagatabank_flutter/UI/page/HouseholdPage.dart';
import 'package:yamagatabank_flutter/UI/page/BalancePage.dart';
import 'package:yamagatabank_flutter/UI/page/CashPage.dart';
import 'package:yamagatabank_flutter/UI/page/tabViewWidget.dart';

import 'CheckOutTabViewWidget.dart';


class CheckOutBalanceState extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _CheckOutBalanceStateState createState() => _CheckOutBalanceStateState();
}

class _CheckOutBalanceStateState extends State<CheckOutBalanceState> {
  @override
  Widget build(BuildContext context) {
    //初始化标签
    List<Widget> tabs = [
      _renderTab(new Text("残高",style:TextStyle(color: Colors.blue))),
      _renderTab(new Text("家計簙",style:TextStyle(color: Colors.blue))),
      _renderTab(new Text("金箱",style:TextStyle(color: Colors.blue)))
    ];
    //一个控件，可以监听返回键
    return Container(
      child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                unselectedLabelColor: Colors.blue,
                indicatorColor: Colors.blue,
//                indicatorSize: TabBarIndicatorSize.label,
//                indicatorWeight:
//
//                10.0,
                tabs: <Widget>[
                  Tab(text: "残高",),
                  Tab(text:"家計簙",),
                  Tab(text: "金箱",),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                new BalancePage(),
                new BouseholdPage(),
                new CashPage()
              ],
            ),
          )
      ),
    );
  }

  _renderTab(text) {
    //返回一个标签
    return new Tab(
        child:new Container(
          //设置paddingTop为6
          padding: new EdgeInsets.only(top: 6),
          //一个列控件
          child: new Column(
            //竖直方向居中
            mainAxisAlignment: MainAxisAlignment.center,
            //水平方向居中
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[text],
          ),
        )
    );
  }
}

