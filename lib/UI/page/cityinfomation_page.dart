import 'package:flutter/material.dart';
import 'package:yamagatabank_flutter/UI/refresh_widget1.dart';
import 'package:yamagatabank_flutter/res/colors.dart';
import 'package:yamagatabank_flutter/widgets/my_pageview.dart';

class CityInfomationPage extends StatefulWidget {
  @override
  CityInfomationPageState createState() => new CityInfomationPageState();
}

class CityInfomationPageState extends State<CityInfomationPage> {
  PageController _pageController;
  int currentpage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       children: <Widget>[
         Container(
           height: MediaQuery.of(context).padding.top,
           color: Color(0xCC004EA2),
         ),

         Container(
           height: 50,
           color: Colors.white,
           child: Stack(
             children: <Widget>[
               Row(
                 children: <Widget>[
                   SizedBox(width: 20,),
                   Icon(Icons.notifications_none),
                   Expanded(flex: 1,child: Container()),

                   Expanded(flex: 1,child: Container()),
                   Icon(Icons.help_outline),
                   SizedBox(width: 10,),
                   Icon(Icons.settings),
                   SizedBox(width: 10,)
                 ],
               ),
               Center(
                 child: Text('タウン情報'),
               ),
             ],
           ),
         ),
         SizedBox(
           height: 1,
           child: Container(
             color: Colours.red,
           ),
         ),
         SizedBox(
           height: 15,
           child: Container(color: Colors.white,),
         ),
         Container(
           width: MediaQuery.of(context).size.width,
           color: Colors.white,
           child: Row(
             children: <Widget>[
               
               Expanded(flex: 1,child: _tabWidget(currentpage==0?true:false,'images/new_selected.png','images/new_normal.png',(){_pageController.jumpToPage(0);})),
               Expanded(flex: 1,child: _tabWidget(currentpage==1?true:false,'images/gourmet_selected.png','images/gourmet_normal.png',(){_pageController.jumpToPage(1);})),
               Expanded(flex: 1,child: _tabWidget(currentpage==2?true:false,'images/event_selected.png','images/event_normal.png',(){_pageController.jumpToPage(2);})),
               Expanded(flex: 1,child: _tabWidget(currentpage==3?true:false,'images/trip_selected.png','images/trip_normal.png',(){_pageController.jumpToPage(3);})),
               Expanded(flex: 1,child: _tabWidget(currentpage==4?true:false,'images/life_selected.png','images/life_normal.png',(){_pageController.jumpToPage(4);})),
               Expanded(flex: 1,child: _tabWidget(currentpage==5?true:false,'images/work_selected.png','images/work_normal.png',(){_pageController.jumpToPage(5);})),
               Expanded(flex: 1,child: _tabWidget(currentpage==6?true:false,'images/special_selected.png','images/special_normal.png',(){_pageController.jumpToPage(6);})),
             ],
           ),
         ),
         SizedBox(
           height: 15,
           child: Container(color: Colors.white,),
         ),
         SizedBox(
           height: 1,
           child: Container(
             color: Colours.yellow,
           ),
         ),
         Expanded(
           flex: 1,
             child: Container(
               child: MyPageView(
                 controller: _pageController,
                 children: <Widget>[
                   HomePage(),
                   HomePage(),
                   HomePage(),
                   HomePage(),
                   HomePage(),
                   HomePage(),
                   HomePage(),
                 ],
                 onPageChanged: (index){
                   setState(() {
                     currentpage = index;
                   });

                 },
               ),
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
    _pageController = new PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(CityInfomationPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
class _tabWidget extends StatelessWidget {
  bool isSelect;
  String selectimg;
  String unselectimg;
  VoidCallback tap;

  _tabWidget(this.isSelect, this.selectimg, this.unselectimg,this.tap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        width: 35,
        height: 35,
        child: Center(child: isSelect?Image.asset(selectimg):Image.asset(unselectimg),),
      ),
    );
  }
}
