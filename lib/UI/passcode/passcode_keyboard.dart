import 'package:flutter/material.dart';

import 'ForgetPassCodeWidget.dart';
import 'key_down_event.dart';
import 'keybaord_item.dart';

/// 自定义密码 键盘
class PassCodeKeyboard extends StatefulWidget {
  final String bottomText;
  final callback;

  PassCodeKeyboard(this.bottomText, this.callback);

  @override
  State<StatefulWidget> createState() {
    return new PassCodeKeyboardStat();
  }
}

class PassCodeKeyboardStat extends State<PassCodeKeyboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void onOkKeyDown() {
    widget.callback(new KeyDownEvent("ok"));
  }

  void onOneKeyDown(BuildContext cont) {
    widget.callback(new KeyDownEvent("1"));
  }

  void onTwoKeyDown(BuildContext cont) {
    widget.callback(new KeyDownEvent("2"));
  }

  void onThreeKeyDown(BuildContext cont) {
    widget.callback(new KeyDownEvent("3"));
  }

  void onFourKeyDown(BuildContext cont) {
    widget.callback(new KeyDownEvent("4"));
  }

  void onFiveKeyDown(BuildContext cont) {
    widget.callback(new KeyDownEvent("5"));
  }

  void onSixKeyDown(BuildContext cont) {
    widget.callback(new KeyDownEvent("6"));
  }

  void onSevenKeyDown(BuildContext cont) {
    widget.callback(new KeyDownEvent("7"));
  }

  void onEightKeyDown(BuildContext cont) {
    widget.callback(new KeyDownEvent("8"));
  }

  void onNineKeyDown(BuildContext cont) {
    widget.callback(new KeyDownEvent("9"));
  }

  void onZeroKeyDown(BuildContext cont) {
    widget.callback(new KeyDownEvent("0"));
  }

  /// 点击删除
  void onDeleteKeyDown() {
    widget.callback(new KeyDownEvent("del"));
  }

  /// 点击取消（擦除输入的所有数字）
  void onCancleKeyDown() {
//    widget.callback(new KeyDownEvent("cancle"));
  }

  void onCloseKeyDown() {
    widget.callback(new KeyDownEvent("close"));
  }

  bool showForget;

  @override
  void initState() {
    // TODO: implement initState
    if (widget.bottomText.length > 0) {
      showForget = true;
    } else {
      showForget = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      key: _scaffoldKey,
      width: double.infinity,
      height: 300.0,

      ///所有控件加起来的高度
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          ///  键盘主体
          new Column(
            children: <Widget>[
              ///  第一行
              new Row(
                children: <Widget>[
                  KeybaordItem(
                      text: '1',
                      isDelete: false,
                      fontSize: 37.0,
                      callback: (val) => onOneKeyDown(context)),
                  KeybaordItem(
                      text: '2',
                      isDelete: false,
                      fontSize: 37.0,
                      callback: (val) => onTwoKeyDown(context)),
                  KeybaordItem(
                      text: '3',
                      isDelete: false,
                      fontSize: 37.0,
                      callback: (val) => onThreeKeyDown(context)),
                ],
              ),

              ///  第二行
              new Row(
                children: <Widget>[
                  KeybaordItem(
                      text: '4',
                      isDelete: false,
                      fontSize: 37.0,
                      callback: (val) => onFourKeyDown(context)),
                  KeybaordItem(
                      text: '5',
                      isDelete: false,
                      fontSize: 37.0,
                      callback: (val) => onFiveKeyDown(context)),
                  KeybaordItem(
                      text: '6',
                      isDelete: false,
                      fontSize: 37.0,
                      callback: (val) => onSixKeyDown(context)),
                ],
              ),

              ///  第三行
              new Row(
                children: <Widget>[
                  KeybaordItem(
                      text: '7',
                      isDelete: false,
                      fontSize: 37.0,
                      callback: (val) => onSevenKeyDown(context)),
                  KeybaordItem(
                      text: '8',
                      isDelete: false,
                      fontSize: 37.0,
                      callback: (val) => onEightKeyDown(context)),
                  KeybaordItem(
                      text: '9',
                      isDelete: false,
                      fontSize: 37.0,
                      callback: (val) => onNineKeyDown(context)),
                ],
              ),

              ///  第四行
              new Row(
                children: <Widget>[
                  KeybaordItem(
                      text: '',
                      isDelete: false,
                      fontSize: 18.0,
                      callback: (val) => onCancleKeyDown()),
                  KeybaordItem(
                      text: '0',
                      isDelete: false,
                      fontSize: 37.0,
                      callback: (val) => onZeroKeyDown(context)),
                  KeybaordItem(
                      text: '',
                      isDelete: true,
                      fontSize: 37.0,
                      callback: (val) => onDeleteKeyDown()),
                ],
              ),
              this.showForget
                  ? Container(
                      height: 50.0,
                      color: Color.fromRGBO(240, 240, 240, 0.9),
                      child: ForgetPassCodeWidget(
                          widget.bottomText, onCloseKeyDown),
                    )
                  : Container(
                      height: 50.0,
                      color: Color.fromRGBO(240, 240, 240, 0.9),
                    )
            ],
          ),

          ///忘记密码
        ],
      ),
    );
  }
}
