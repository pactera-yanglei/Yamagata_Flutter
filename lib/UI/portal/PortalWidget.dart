import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperPage extends StatefulWidget {
  @override
  SwiperPageState createState() {
    return SwiperPageState();
  }
}

class SwiperPageState extends State<SwiperPage> {
  List images = [
    'images/balance_default.png',
    'images/balance_default.png',
    'images/balance_default.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.notifications_none),
        title: Text('ポータル'),
        centerTitle: true,
        actions: <Widget>[Icon(Icons.help_outline), Icon(Icons.settings)],
      ),
      body: Column(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              height: 120.0,
              child: Swiper(
                itemCount: images.length,
                itemBuilder: _swiperBuilder,
                //是否自动播放
                autoplay: true,
                //自动播放延迟
                autoplayDelay: 3000,
                //触发时是否停止播放
                autoplayDisableOnInteraction: true,
                onTap: (index) => print('点击了第$index个'),
              )),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 275.0,
            color: Colors.black12,
            child: GridView.count(
              crossAxisCount: 2,
              children: _getGridList(),
              padding: EdgeInsets.all(10.0),
              crossAxisSpacing: 10.0,
              //水平距离
              mainAxisSpacing: 10.0,
              //垂直距离
              childAspectRatio: 2 / 1,
            ),
          )
        ],
//           color: Colors.black,
      ),
    );
  }

  List menu = [
    ['0', 'Icons.lock_outline', 'asdfasd'],
    ['1', 'images/balance_default.png', 'asdfa'],
    ['1', 'images/balance_default.png', 'asdfa'],
    ['0', 'images/balance_default.png', 'asdfa'],
    ['0', 'images/balance_default.png', 'asdfa'],
    ['1', 'images/balance_default.png', 'asdfa'],
    ['1', 'images/balance_default.png', 'asdfa'],
    ['0', 'images/balance_default.png', 'asdfa']
  ];
  List<Widget> _getGridList() {
    return menu.map((item) {
      print(item);
      return InkWell(
        onTap: (){

        },
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: item[0] == '0' ? Colors.blue : Colors.lightBlueAccent,
              ),
              padding: EdgeInsets.only(left: 80.0,top: 30.0),
              width: (MediaQuery.of(context).size.width-40)/2,
              height: 90.0,
              child: Text(item[2]),
            ), 
            Container(
              padding: EdgeInsets.only(left: 10.0,top: 25.0),
              height: 50.0,
              width: 50.0,
              child: CircleAvatar(
                  child: Icon(Icons.lock_outline)
              ),
            )
          ],
        ),


      );
    }).toList();
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.asset(
      images[index],
      fit: BoxFit.fill,
    ));
  }
}
