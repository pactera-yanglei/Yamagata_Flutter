import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yamagatabank_flutter/res/colors.dart';
import 'package:yamagatabank_flutter/routers/fluro_navigator.dart';
import 'package:yamagatabank_flutter/routers/splash_routes.dart';

class LoginWeb extends StatefulWidget {
//  final pcontext;
//
//  const LoginWeb({Key key,@required this.pcontext}) : super(key: key);

  @override
  State<StatefulWidget> createState() {

    // TODO: implement createState
    return LoginWebStateState();
  }
}

class LoginWebStateState extends State<LoginWeb> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).padding.top,
            color: Colours.top_app_main,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
            child: WebView(
                initialUrl:
                    'https://www.moneytree.jp/link/mobile/#/app/vault?client_id=c22239ab913baefb586a707b7cf1713b0f639bbcb586b9c83a4d1222cd29c8b3&redirect_uri=minefocus-yamagatabank://mt/login/callback&response_type=code&scope=guest_read%20accounts_read%20transactions_read%20request_refresh%20points_read%20point_transactions_read%20investment_accounts_read%20investment_transactions_read',
                javascriptMode: JavascriptMode.unrestricted,
                navigationDelegate: (NavigationRequest request) {
                  print("即将打开 ${request.url}");
                  if (request.url.startsWith("minefocus-yamagatabank")) {
                    print("即将打开 ${request.url}");
                    String code = request.url.split('code=')[1];
                    SpUtil.putString('code', code);
                    NavigatorUtils.push(context, SplashRouter.mainPage,
                        replace: true);
//            _openOtherApp('${request.url}');
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
                      }),
                  JavascriptChannel(
                      name: "openURLWithChromeView",
                      onMessageReceived: (JavascriptMessage message) {
                        print("参数2： ${message.message}");
                      }),
                  JavascriptChannel(
                      name: "openMoneyTree",
                      onMessageReceived: (JavascriptMessage message) {
                        print("参数3： ${message.message}");
                      }),
                  JavascriptChannel(
                      name: "closeWindow",
                      onMessageReceived: (JavascriptMessage message) {
                        print("参数4： ${message.message}");
                      }),
                ].toSet()),
          )
        ],
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
