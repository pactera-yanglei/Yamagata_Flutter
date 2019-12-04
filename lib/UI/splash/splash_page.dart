import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:yamagatabank_flutter/res/colors.dart';
import 'package:yamagatabank_flutter/routers/fluro_navigator.dart';
import 'package:yamagatabank_flutter/routers/splash_routes.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => new SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  PageController _pageController;
  PageView _pageView;
  int _currentPage = 0;
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
                  Column(
                    children: <Widget>[
                      Expanded(flex: 1,child: SizedBox()),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                flex: 2,
                                child: Container(
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: (){
                                          NavigatorUtils.push(context, SplashRouter.rulesPage, replace: true);
                                        },
                                        child: Text(
                                            'スキップ',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colours.app_main
                                            )
                                        ),
                                      )
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
                                        dotWidget(_currentPage==0?true:false),
                                        SizedBox(width: 10,),
                                        dotWidget(_currentPage==1?true:false),
                                        SizedBox(width: 10,),
                                        dotWidget(_currentPage==2?true:false),
                                        SizedBox(width: 10,),
                                        dotWidget(_currentPage==3?true:false),
                                        SizedBox(width: 10,),
                                        dotWidget(_currentPage==4?true:false),
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
                                        if(_currentPage!=4){
                                          _pageController.animateToPage(_currentPage+1, duration: Duration(milliseconds: 1000), curve: Curves.ease);
                                        }else{
                                          NavigatorUtils.push(context, SplashRouter.rulesPage, replace: true);
                                        }
                                      },
                                      child: Text(
                                          _currentPage==4?'完了':'次へ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color:Colours.app_main
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
        ImagePage('images/guidepage_1.png'),
        ImagePage('images/guidepage_2.png'),
        ImagePage('images/guidepage_3.png'),
        ImagePage('images/guidepage_4.png'),
        ImagePage('images/guidepage_5.png'),
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
  void didUpdateWidget(SplashPage oldWidget) {
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
