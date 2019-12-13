import 'package:flutter/material.dart';
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
        initialUrl: 'https://www.moneytree.jp/link/mobile/#/app/vault?client_id=c22239ab913baefb586a707b7cf1713b0f639bbcb586b9c83a4d1222cd29c8b3&redirect_uri=minefocus-yamagatabank://mt/login/callback&response_type=code&scope=guest_read%20accounts_read%20transactions_read%20request_refresh%20points_read%20point_transactions_read%20investment_accounts_read%20investment_transactions_read%22',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

}