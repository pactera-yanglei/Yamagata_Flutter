import 'package:flutter/material.dart';
import 'package:yamagatabank_flutter/UI/page/CheckOutBalancePage.dart';
import 'package:yamagatabank_flutter/UI/page/HouseholdPage.dart';
import 'package:yamagatabank_flutter/UI/page/BalancePage.dart';
import 'package:yamagatabank_flutter/UI/page/CashPage.dart';
import 'package:yamagatabank_flutter/UI/page/tabViewWidget.dart';


class CheckOutTabWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //初始化标签
    List<Widget> tabs = [
      _renderTab(new Text("残高",style:TextStyle(color: Colors.blue))),
      _renderTab(new Text("家計簙",style:TextStyle(color: Colors.blue))),
      _renderTab(new Text("金箱",style:TextStyle(color: Colors.blue)))
    ];
    //一个控件，可以监听返回键
    return new WillPopScope(
      child:
          Container(
//            height: MediaQuery.of(context).size.height*0.85,
//            width: MediaQuery.of(context).size.width,
            child:new TabBarWidget(
//              indicatorColor:Colors.blue,
              title: new Text("家計管理",textAlign: TextAlign.center,),
              type: TabBarWidget.TOP_TAB,
              tabItems: tabs,
              tabViews: [
                new CheckOutBalanceState(),
                new BouseholdPage(),
                new CashPage()
              ],
              backgroundColor: Theme.of(context).primaryColor,
              indicatorColor: Theme.of(context).indicatorColor,
            ),
          )
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

