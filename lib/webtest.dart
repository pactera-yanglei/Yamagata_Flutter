import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:yamagatabank_flutter/UI/MainTabWidget.dart';
import 'package:yamagatabank_flutter/routers/fluro_navigator.dart';
import 'package:yamagatabank_flutter/routers/splash_routes.dart';
class WebTest extends StatefulWidget {
  @override
  WebTestState createState() => new WebTestState();
}

class WebTestState extends State<WebTest> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
   String urlaa = 'https://www.moneytree.jp/link/mobile/#/app/vault?client_id=c22239ab913baefb586a707b7cf1713b0f639bbcb586b9c83a4d1222cd29c8b3&redirect_uri=minefocus-yamagatabank://mt/login/callback&response_type=code&scope=guest_read%20accounts_read%20transactions_read%20request_refresh%20points_read%20point_transactions_read%20investment_accounts_read%20investment_transactions_read';
  @override
  Widget build(BuildContext context) {
//    return MaterialApp(
//      routes: {
//        "/": (_) => new WebviewScaffold(
//          url: "https://www.moneytree.jp/link/mobile/#/app/vault?client_id=c22239ab913baefb586a707b7cf1713b0f639bbcb586b9c83a4d1222cd29c8b3&redirect_uri=minefocus-yamagatabank://mt/login/callback&response_type=code&scope=guest_read%20accounts_read%20transactions_read%20request_refresh%20points_read%20point_transactions_read%20investment_accounts_read%20investment_transactions_read%22",
//          appBar: new AppBar(
//            title: new Text("Widget webview"),
//          ),
//        ),
//      },
//    );
    return WebviewScaffold(
      url: "https://www.moneytree.jp/link/mobile/#/app/vault?client_id=c22239ab913baefb586a707b7cf1713b0f639bbcb586b9c83a4d1222cd29c8b3&redirect_uri=minefocus-yamagatabank://mt/login/callback&response_type=code&scope=guest_read%20accounts_read%20transactions_read%20request_refresh%20points_read%20point_transactions_read%20investment_accounts_read%20investment_transactions_read",
      appBar: new AppBar(
        title: const Text('Widget webview'),
      ),
      withZoom: true,
      withLocalStorage: true,
useWideViewPort: true,
allowFileURLs: true,
withOverviewMode: true,
displayZoomControls: false,
enableAppScheme: true,
      hidden: true,
      initialChild: Container(
        color: Colors.redAccent,
        child: const Center(
          child: Text('Waiting.....'),
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      print('aaa'+url);
      if(url.startsWith('minefocus-yamagatabank://mt/login/callback?code')){
        print('----------------');
        NavigatorUtils.push(context, SplashRouter.mainPage, replace: true);
      }else{
        print('00000');
      }

    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(WebTest oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
