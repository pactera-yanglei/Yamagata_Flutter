import 'package:flutter/material.dart';
import 'package:yamagatabank_flutter/UI/page/CheckOutBalancePage.dart';
import 'package:yamagatabank_flutter/UI/page/HouseholdPage.dart';
import 'package:yamagatabank_flutter/UI/page/BalancePage.dart';
import 'package:yamagatabank_flutter/UI/page/CashPage.dart';
import 'package:yamagatabank_flutter/UI/page/tabViewWidget.dart';
import 'package:yamagatabank_flutter/res/colors.dart';
import 'package:yamagatabank_flutter/widgets/my_pageview.dart';

class CheckOutTabWidget1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //初始化标签
    List<Widget> tabs = [
      _renderTab(new Text("残高", style: TextStyle(color: Colors.blue))),
      _renderTab(new Text("家計簙", style: TextStyle(color: Colors.blue))),
      _renderTab(new Text("貯金箱", style: TextStyle(color: Colors.blue)))
    ];
    //一个控件，可以监听返回键
    return new WillPopScope(
      child: new TabBarWidget(
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
    );
  }

  _renderTab(text) {
    //返回一个标签
    return new Tab(
        child: new Container(
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
    ));
  }
}

class CheckOutTabWidget extends StatefulWidget {
  @override
  CheckOutTabWidgetState createState() => new CheckOutTabWidgetState();
}

class CheckOutTabWidgetState extends State<CheckOutTabWidget> {
  PageController _pageController;
  MyPageView _pageView;
  int _currentPage = 0;
  int tapnum = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.notifications_none),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        actions: <Widget>[Icon(Icons.help_outline), Icon(Icons.settings)],
        title: Text(
          "家計管理",
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child:GestureDetector(
                        onTap: (){
                          tapnum=0;
                          _pageController.jumpToPage(0);
//                          _pageController.animateToPage(0, duration: Duration(milliseconds: 1000), curve: Curves.ease);
                          setState(() {
                            _currentPage=0;

                          });
                        },
                        child:  Container(
                          height: 40,
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Container(
                              decoration: _currentPage == 0
                                  ? BoxDecoration(
                                  color: Colours.app_main,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)))
                                  : null,
                              child: Center(
                                child: Text("残高",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize:15,color: _currentPage==0?Colors.white:Colours.app_main)),
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                  Expanded(
                      child: GestureDetector(
                        onTap: (){
                          tapnum=1;
//                          _pageController.animateToPage(1, duration: Duration(milliseconds: 1000), curve: Curves.ease);
                          _pageController.jumpToPage(1);
                          setState(() {
                            _currentPage=1;

                          });
                        },
                        child: Container(
                          height: 40,
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Container(
                              decoration: _currentPage == 1
                                  ? BoxDecoration(
                                  color: Colours.app_main,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)))
                                  : null,
                              child: Center(
                                child: Text("家計簙",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize:15,color: _currentPage==1?Colors.white:Colours.app_main)),
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                  Expanded(
                      child: GestureDetector(
                        onTap: (){
                          tapnum=2;
                          _pageController.jumpToPage(2);
//                          _pageController.animateToPage(2, duration: Duration(milliseconds: 1000), curve: Curves.ease);
                          setState(() {
                            _currentPage = 2;

                          });
                        },
                        child: Container(
                          height: 40,
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Container(
                              decoration: _currentPage == 2
                                  ? BoxDecoration(
                                  color: Colours.app_main,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)))
                                  : null,
                              child: Center(
                                child: Text("貯金箱",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15, color:_currentPage==2?Colors.white:Colours.app_main)),
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                ],
              ),
            ),
            Container(
              height: 2,
              color: Colours.app_main,
            ),
            Expanded(
              child: _pageView,
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = new PageController();
    _pageView = new MyPageView(
      controller: _pageController,
      children: <Widget>[
        new CheckOutBalanceState(),
        new BouseholdPage(),
        new CashPage()
      ],
      onPageChanged: (index) {
        setState(() {
          _currentPage = index;
        });
      },
    );
  }
}

