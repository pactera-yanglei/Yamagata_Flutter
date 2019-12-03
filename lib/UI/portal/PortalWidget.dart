import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperPage extends StatefulWidget {
  @override
  SwiperPageState createState() {
    return SwiperPageState();
  }
}

class SwiperPageState extends State<SwiperPage> {
  List images=[
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
        actions: <Widget>[
          Icon(Icons.help_outline),
          Icon(Icons.settings)
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              height: 140.0,
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
              )
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height-300.0,
            color: Colors.black,
            child: GridView.count(
              crossAxisCount: 2,
               children: _getGridList(),
              padding: EdgeInsets.all(10.0),
              crossAxisSpacing: 20.0,
              //水平距离
              mainAxisSpacing: 20.0,
              //垂直距离
              childAspectRatio: 2/1,
            ),
          )
        ],
//           color: Colors.black,
       ),

    );
  }
 List menu=[['0','','asdfasd']];
  List<Widget> _getGridList() {
    return menu.map((item) {
      return GridViewItem();
    }).toList();
  }
  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.asset(
      images[index],
      fit: BoxFit.fill,
    ));
  }
}
class GridViewItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('文本'),
      color: Colors.pink[200],
    );
  }
}