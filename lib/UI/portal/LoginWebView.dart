import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginWeb extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginWebStateState();
  }

}

class LoginWebStateState extends State<LoginWeb>{
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: WebView(
        initialUrl: 'https://www.moneytree.jp/link/mobile/#/app/vault?client_id=c22239ab913baefb586a707b7cf1713b0f639bbcb586b9c83a4d1222cd29c8b3&redirect_uri=minefocus-yamagatabank://mt/login/callback&response_type=code&scope=guest_read%20accounts_read%20transactions_read%20request_refresh%20points_read%20point_transactions_read%20investment_accounts_read%20investment_transactions_read',
        javascriptMode: JavascriptMode.unrestricted,
          navigationDelegate: (NavigationRequest request) {
            print("即将打开 ${request.url}");
          if(request.url.startsWith("minefocus-yamagatabank")){
            print("即将打开 ${request.url}");
            _openOtherApp('${request.url}');
            return NavigationDecision.prevent;
          }

            return NavigationDecision.navigate;
          },
        onPageFinished: (url) {
          print(url);
        },
          javascriptChannels: <JavascriptChannel>[
            JavascriptChannel(
                name: "openURLwithbrowser",
                onMessageReceived: (JavascriptMessage message) {
                  print("参数1： ${message.message}");
                }
            ),JavascriptChannel(
                name: "openURLWithChromeView",
                onMessageReceived: (JavascriptMessage message) {
                  print("参数2： ${message.message}");
                }
            ),JavascriptChannel(
                name: "openMoneyTree",
                onMessageReceived: (JavascriptMessage message) {
                  print("参数3： ${message.message}");
                }
            ),JavascriptChannel(
                name: "closeWindow",
                onMessageReceived: (JavascriptMessage message) {
                  print("参数4： ${message.message}");
                }
            ),
          ].toSet()
      ),
    );
  }
  void _openOtherApp(String u) async {


    if (await canLaunch(u)) {

     await launch(u);

    } else {

     throw 'Could not launch $u';

    }

    }

}