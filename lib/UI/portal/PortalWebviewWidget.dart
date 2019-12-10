import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:webview_flutter/webview_flutter.dart';


class PortalWebviewWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SwiperPageState1();
  }
}

class SwiperPageState1 extends State<PortalWebviewWidget> {
  WebViewController _controller;
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
            child: WebView(
              initialUrl: 'https://contents-dev.scsk-api.minefocus.jp/images/contents/YAMAGATADEV_IP0001001_C.html',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller){
                _controller=controller;
              },
            navigationDelegate: (NavigationRequest request){
                if(request.url.startsWith('https://')){
                  print(request.url);
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
            },
            ),
          )
        ],
//           color: Colors.black,
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.asset(
      images[index],
      fit: BoxFit.fill,
    ));
  }
}