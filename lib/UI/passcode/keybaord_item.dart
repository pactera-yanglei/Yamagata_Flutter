import 'package:flutter/material.dart';

class KeybaordItem extends StatefulWidget {
  ///  按钮显示的文本内容
  String text;

  ///是否是删除按钮
  bool isDelete = false;

  ///字体大小
  double fontSize = 37.0;

  KeybaordItem({Key key, this.text, this.isDelete,this.fontSize,this.callback})
      : super(key: key);

  ///  按钮 点击事件的回调函数
  final callback;

  @override
  State<StatefulWidget> createState() {
    return ButtonState();
  }
}

class ButtonState extends State<KeybaordItem> {
  ///回调函数执行体
  var backMethod;

  void Tap() {
    widget.callback('$backMethod');
  }

  @override
  Widget build(BuildContext context) {
    /// 获取当前屏幕的总宽度，从而得出单个按钮的宽度
    MediaQueryData mediaQuery = MediaQuery.of(context);
    var _screenWidth = mediaQuery.size.width;

    if (!widget.isDelete) {
      ///数字键
      return new Container(
          height: 60.0,
          width: _screenWidth / 3,
          color: Color.fromRGBO(240, 240, 240, 0.9),
          child: new OutlineButton(
            // 直角
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(0.0)),
            // 边框颜色
            borderSide: new BorderSide(color: Color(0xffffffff)),

            child: new Text(
              widget.text,
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.w400),
            ),
            // 按钮点击事件
            onPressed: Tap,
          )
      );
    } else {
      ///删除键
      return new Container(
          height: 60.0,
          width: _screenWidth / 3,
          color: Color.fromRGBO(240, 240, 240, 0.9),
          child: new OutlineButton(
            // 直角
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(0.0)),
            // 边框颜色
            borderSide: new BorderSide(color: Color(0xffffffff)),

            child: Image.asset(
              "assets/icon/general_icon_close.png",
              width: 50,
              height: 50,
              fit: BoxFit.scaleDown,
            ),
            // 按钮点击事件
            onPressed: Tap,
          ));
    }
  }
}
