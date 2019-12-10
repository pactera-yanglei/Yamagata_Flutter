import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NetbankWebviewWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NetbankWebviewState();
  }

}

class NetbankWebviewState extends State<NetbankWebviewWidget>{
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: WebView(
        initialUrl: 'https://ib1.yamagatabank.co.jp/YGIK/BankIK?xtr=aulogon01000&NLS=IKS',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

}