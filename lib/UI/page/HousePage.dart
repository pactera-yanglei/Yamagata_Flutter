import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:yamagatabank_flutter/UI/portal/LoginWebView.dart';

import '../MainTabWidget.dart';
import 'WheelPlanting1Page.dart';

class HousePage extends StatefulWidget {
  @override
  HousePageState createState() => new HousePageState();
}

class HousePageState extends State<HousePage> {
  PageController _pageController;
  PageView _pageView;
  int _currentPage = 0;
  int i;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).padding.top,
            color: Color(0xCC004EA2),
          ),
          Expanded(
              flex: 1,
              child: Stack(
                children: <Widget>[
                  _pageView,
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width:MediaQuery.of(context).size.width,
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.only(right: 10.0,top: 10.0),
                          child: GestureDetector(
                            onTap: (){
//                              Navigator.push(context, MaterialPageRoute(builder: (content){
//                                return MainTabWidget();
//                              }));
                            Navigator.of(context).pop();
                            },
                            child: Text(
                              '閉じる',style: TextStyle(fontSize: 18.0,color: Colors.black),
                            ),
                          ),
                        ),

                      ],
                    ),),
                  Offstage(
                    //控制显示控件
                    offstage: _currentPage==2?false:true,
                    child:Container(
                      padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.7,left: MediaQuery.of(context).size.width*0.1 ),

                      child: Column(
                        children: <Widget>[
                          Row(children: <Widget>[

                            Container(
                              width:MediaQuery.of(context).size.width*0.8,
                              child:MaterialButton(
                                  elevation: 0,
                                  color: Colors.blue,
                                  child: Text(
                                    'Moneytreeを設定する',
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder:(context){
                                      return LoginWeb();
                                    }));
                                  }),
                            )
                          ],),
                          Row(
                            children: <Widget>[
                              Container(
                                width:MediaQuery.of(context).size.width*0.8,
                                child:MaterialButton(
                                    elevation: 0,
                                    color: Colors.black12,
                                    child: Text(
                                      '使い方を見る',
                                      style: TextStyle(color: Colors.blueAccent),
                                      textAlign: TextAlign.center,
                                    ),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder:(context){
                                        return SplashPage1();
                                      }));
                                    }),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Expanded(flex: 1,child: SizedBox()),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child:

                        Row(
                          children: <Widget>[
                            Expanded(
                                flex: 2,
                                child: Container(
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: (){
                                        _pageController.animateToPage(_currentPage-1, duration: Duration(milliseconds: 1000), curve: Curves.ease);
                                      },
                                      child: Text(
                                          _currentPage==0?'':'前へ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.blueAccent
                                          )
                                      ),
                                    ),
                                  ),
                                )
                            ),
                            Expanded(
                                flex: 2,
                                child: Row(
                                  children: <Widget>[
                                    Expanded(flex: 1,child: Container()),
                                    Row(
                                      children: <Widget>[
                                        numberWidget(_currentPage),
                                      ],
                                    ),
                                    Expanded(flex: 1,child: Container()),
                                  ],
                                )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: (){
                                        if(_currentPage!=2){
                                          _pageController.animateToPage(_currentPage+1, duration: Duration(milliseconds: 1000), curve: Curves.ease);
                                        }else{
                                          Navigator.push(context, MaterialPageRoute(builder: (context){
                                            return MainTabWidget();
                                          }));

                                        }
                                      },
                                      child: Text(
                                          _currentPage==2?'完了':'次へ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color:Colors.blueAccent
                                          )
                                      ),
                                    ),
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20)
                    ],
                  )
                ],
              )
          )
        ],
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SpUtil.putString('isFirst', 'rules');
    _pageController = new PageController();
    _pageView = new PageView(
      controller: _pageController,
      children: <Widget>[
        ImagePage('images/account_book_guide_image_1.png'),
        ImagePage('images/account_book_guide_image_2.png'),
        ImagePage('images/account_book_guide_image_3.png'),
      ],
      onPageChanged: (index) {
        setState(() {
          _currentPage = index;
        });
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(HousePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
class ImagePage extends StatelessWidget {
  String name;

  ImagePage(this.name);

  @override
  Widget build(BuildContext context) {
    return Image.asset(name,fit: BoxFit.fill,);
  }
}

class dotWidget extends StatelessWidget {
  bool isSelect = false;

  dotWidget(this.isSelect);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height:10,
      decoration: BoxDecoration(
          color: isSelect?Color(0xff004EA2):Color(0xffA6C6E0),
          borderRadius:BorderRadius.all(Radius.circular(5))
      ),
    );
  }
}

class numberWidget extends StatelessWidget{
  int i;
  numberWidget(this.i);
  @override
  Widget build(BuildContext context) {
    print(i);
    // TODO: implement build
    if(i==0){
      return Container(
        child: Text(
          '1/3',style: TextStyle(fontSize: 18.0),
        ),
      );
    }else if(i==1){
      return Container(
        child: Text(
          '2/3',style: TextStyle(fontSize: 18.0),
        ),
      );
    }else{
      return Container(
        child: Text(
          '3/3',style: TextStyle(fontSize: 18.0),
        ),
      );
    }
  }
}
