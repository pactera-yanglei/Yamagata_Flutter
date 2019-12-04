import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yamagatabank_flutter/res/colors.dart';
import 'package:yamagatabank_flutter/routers/fluro_navigator.dart';
import 'package:yamagatabank_flutter/routers/splash_routes.dart';
import 'package:yamagatabank_flutter/widgets/web_widget.dart';

class RulesPage extends StatefulWidget {
  bool isCheck = false;
  @override
  RulesPageState createState() => new RulesPageState();
}

class RulesPageState extends State<RulesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).padding.top,
            color: Colours.top_app_main,
          ),
          Container(
            height: 40,
            child: Center(
              child: Text('利用規約',style: TextStyle(
                fontSize: 15,
              )),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colours.line_red,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(padding: EdgeInsets.only(left: 20,right: 20),
            child: Text('ご利用規約をお読みいただき、同意の上でご利用ください。'),),
          SizedBox(
            height: 20,
          ),

          Expanded(flex: 1,child: Container(color: Colors.white,
            child: WebWidget('https://www.baidu.com'),
          )
          ),

          SizedBox(height: 20,),
          Container(
            height: 20,
            child: Center(
              child: Row(
                children: <Widget>[
                  Expanded(flex:1,child: Container()),
                  GestureDetector(
                    onTap: (){

                      setState(() {
                        widget.isCheck = !widget.isCheck;
                      });
                    },
                    child: Icon(widget.isCheck?Icons.check_circle:Icons.panorama_fish_eye,color: Colours.app_main,),
                  ),
                  SizedBox(width: 5,),

                  Text('利用規約に同意します', style: TextStyle(color: widget.isCheck?Colours.app_main:Colors.black)),
                  Expanded(flex:1,child: Container()),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
              if(widget.isCheck){
                SpUtil.putString('isFirst', 'no');
                NavigatorUtils.push(context, SplashRouter.welcomePage, replace: true);
              }else{
                showDialog<Null>(
                    context: context, //BuildContext对象
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return new MessageDialog( //调用对话框
                        title: '正在获取详情...',
                        message: 'adad',
                        onCloseEvent: (){},
                      );
                    });
              }

            },
            child: Container(
              width: 120,
              height: 50,
              decoration: new BoxDecoration(
                  color:  Colours.app_main,
                  //设置Border属性给容器添加边框
                  borderRadius:BorderRadius.all(Radius.circular(5))
              ),

              child: Center(
                  child: Text('進む',
                    style: TextStyle(color: Colors.white),)
              ),
            ),
          ),

          SizedBox(height: 10,),
        ],
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(RulesPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
class MessageDialog extends Dialog {
  String title;
  String message;
  String negativeText;
  String positiveText;
  Function onCloseEvent;
  Function onPositivePressEvent;

  MessageDialog({
    Key key,
    @required this.title,
    @required this.message,
    this.negativeText,
    this.positiveText,
    this.onPositivePressEvent,
    @required this.onCloseEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(15.0),
      child: new Material(
        type: MaterialType.transparency,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: ShapeDecoration(
                color: Color(0xffffffff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(3.0),
                  ),
                ),
              ),
              width:  MediaQuery.of(context).size.width-80,
              height:280,
              margin: const EdgeInsets.all(12.0),
              child: new Column(
                children: <Widget>[

                  Expanded(flex: 1,child: Container()),
                  Image.asset('images/ic_error.png',fit: BoxFit.fill,width: 60,height: 60,),
                  SizedBox(height: 20,),
                  Text('ご確認ください',style: TextStyle(
                    color: Colours.cb_uncheck,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),),
                  SizedBox(height: 10,),
                  Text('利用規約に同意してからお進みください',style: TextStyle(

                    fontSize: 12,
                    color: Colours.cb_uncheck,

                  ),),
                  SizedBox(height: 20,),


                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 150,
                      height: 50,

                      decoration: new BoxDecoration(
                        border:  Border.all(color: Colours.app_main, width: 1),
                        color:  Colours.btn_color1,
                        //设置Border属性给容器添加边框
                        borderRadius:BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Center(
                          child:Center(
                            child: Text('OK',style: TextStyle(
                              color: Colours.app_main,
                            ),),
                          )
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButtonGroup() {
    var widgets = <Widget>[];
    if (negativeText != null && negativeText.isNotEmpty) widgets.add(_buildBottomCancelButton());
    if (positiveText != null && positiveText.isNotEmpty) widgets.add(_buildBottomPositiveButton());
    return new Flex(
      direction: Axis.horizontal,
      children: widgets,
    );
  }

  Widget _buildBottomCancelButton() {
    return new Flexible(
      fit: FlexFit.tight,
      child: new FlatButton(
        onPressed: onCloseEvent,
        child: new Text(
          negativeText,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomPositiveButton() {
    return new Flexible(
      fit: FlexFit.tight,
      child: new FlatButton(
        onPressed: onPositivePressEvent,
        child: new Text(
          positiveText,
          style: TextStyle(
            color: Color(Colors.teal.value),
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}