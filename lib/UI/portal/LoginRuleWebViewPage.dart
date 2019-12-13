import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yamagatabank_flutter/widgets/web_widget.dart';

class LoginRuleWebViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginRuleWebViewPageState();
  }
}

class LoginRuleWebViewPageState extends State<LoginRuleWebViewPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
//        elevation: 0,
        backgroundColor: Colors.black38,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(right: 10.0),
                  height: 30.0,
                  width: 35.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset('images/ic_close.png'),
                  ))
            ],
          ),
        ],
      ),
      body: Container(
//        padding: EdgeInsets.only(top: 20.0),
        child: WebWidget(
              'https://contents-dev.scsk-api.minefocus.jp/images/contents/YAMAGATADEV_AK0001018_A.html',
        ),
      ),
    );
  }
}
