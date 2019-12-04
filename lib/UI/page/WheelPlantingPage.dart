//import 'package:flutter/material.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';
//
//class wheelPlantingPage extends StatefulWidget {
//  @override
//  _wheelPlantingPageState createState() => _wheelPlantingPageState();
//}
//
//class _wheelPlantingPageState extends State<wheelPlantingPage> {
//  List images = [
//    'images/account_book_guide_image_1.png',
//    'images/account_book_guide_image_2.png',
//    'images/account_book_guide_image_3.png'
//  ];
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//        body: Column(children: <Widget>[
//      Container(
//          width: MediaQuery.of(context).size.width,
//          height: MediaQuery.of(context).size.height,
//          child: Stack(
//            children: <Widget>[
//              Container(
//                child: Swiper(
//                  itemCount: images.length,
//                  itemBuilder: _swiperBuilder,
//                  //是否自动播放
//                  autoplay: false,
//                  //是否循环
//                  loop: false,
//                  //分页指示器
//                  pagination: SwiperPagination(
//                      alignment: Alignment.bottomCenter,
//                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
//                      builder: FractionPaginationBuilder(
//                        //选中时字体大小
//                          activeFontSize: 18,
//                          //字体大小
//                          fontSize: 18,
//                          //字体颜色
//                          color: Colors.black,
//                          //选中时字体颜色
//                          activeColor: Colors.black)),
//
//                ),
//              ),
//              Column(
//                children: <Widget>[
//
//                  Container(
//                    padding: EdgeInsets.only(bottom:10.0),
//                    width:MediaQuery.of(context).size.width,
//                    height: 50,
//                    child: Row(
//                      children: <Widget>[
//                        Expanded(flex:2,child: Container(
//                          child: Center(
//                            child: Text('前へ'),
//                          ),
//                        ))
//                      ],
//                    ),
//                  )
//                ],
//              )
//            ],
//          )),
//    ]));
//  }
//
//  Widget _swiperBuilder(BuildContext context, int index) {
//    return (Image.asset(
//      images[index],
//      fit: BoxFit.fill,
//    ));
//  }
//}
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:yamagatabank_flutter/res/colors.dart';
import 'package:yamagatabank_flutter/routers/fluro_navigator.dart';
import 'package:yamagatabank_flutter/routers/splash_routes.dart';

import '../MainTabWidget.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => new SplashPageState();
}

class SplashPageState extends State<SplashPage> {
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
                                           _pageController.animateToPage(_currentPage-1, duration: Duration(milliseconds: 1000), curve: Curves.ease);
                                       },
                                       child: Text(
                                           _currentPage==0?'':'前へ',
                                           style: TextStyle(
                                               fontSize: 18,
                                               color: Colours.app_main
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
           '1/3'
       ),
     );
   }else if(i==1){
     return Container(
       child: Text(
           '2/3'
       ),
     );
   }else{
     return Container(
       child: Text(
           '3/3'
       ),
     );
   }

  }

}
