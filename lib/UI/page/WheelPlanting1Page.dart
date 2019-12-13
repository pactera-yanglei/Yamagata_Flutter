import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

import 'WheelPlantingPage.dart';

class SplashPage1 extends StatefulWidget {
  @override
  SplashPageState1 createState() => new SplashPageState1();
}

class SplashPageState1 extends State<SplashPage1> {
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
//                                return SplashPage();
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
                                        if(_currentPage!=10){
                                          _pageController.animateToPage(_currentPage+1, duration: Duration(milliseconds: 1000), curve: Curves.ease);
                                        }else{
                                          Navigator.push(context, MaterialPageRoute(builder: (context){
                                            return SplashPage();
                                          }));

                                        }
                                      },
                                      child: Text(
                                          _currentPage==10?'完了':'次へ',
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
                      SizedBox(height: 20,)
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
        ImagePage('images/moneytree_description_1.png'),
        ImagePage('images/moneytree_description_2.png'),
        ImagePage('images/moneytree_description_3.png'),
        ImagePage('images/moneytree_description_4.png'),
        ImagePage('images/moneytree_description_5.png'),
        ImagePage('images/moneytree_description_6.png'),
        ImagePage('images/moneytree_description_7.png'),
        ImagePage('images/moneytree_description_8.png'),
        ImagePage('images/moneytree_description_9.png'),
        ImagePage('images/moneytree_description_10.png'),
        ImagePage('images/moneytree_description_11.png'),
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
  void didUpdateWidget(SplashPage1 oldWidget) {
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
          '1/11',style: TextStyle(fontSize: 18.0),
        ),
      );
    }else if(i==1){
      return Container(
        child: Text(
          '2/11',style: TextStyle(fontSize: 18.0),
        ),
      );
    }else if(i==2){
      return Container(
        child: Text(
          '3/11',style: TextStyle(fontSize: 18.0),
        ),
      );
    }else if(i==3){
      return Container(
        child: Text('4/11',style: TextStyle(fontSize: 18.0),),
      );
    }else if(i==4){
      return Container(
        child: Text('5/11',style: TextStyle(fontSize: 18.0),),
      );
    }else if(i==5){
      return Container(
        child: Text('6/11',style: TextStyle(fontSize: 18.0),),
      );
    }else if(i==6){
      return Container(
        child: Text('7/11',style: TextStyle(fontSize: 18.0),),
      );
    }else if(i==7){
      return Container(
        child: Text('8/11',style: TextStyle(fontSize: 18.0),),
      );
    }else if(i==8){
      return Container(
        child: Text('9/11',style: TextStyle(fontSize: 18.0),),
      );
    }else if(i==9){
      return Container(
        child: Text('10/11',style: TextStyle(fontSize: 18.0),),
      );
    }else if(i==10){
      return Container(
        child: Text('11/11',style: TextStyle(fontSize: 18.0),),
      );
    }
  }
}
