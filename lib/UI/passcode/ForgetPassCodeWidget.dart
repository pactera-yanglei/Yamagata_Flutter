import 'package:flutter/material.dart';

class ForgetPassCodeWidget extends StatefulWidget {
  final String text;
  final callback;

  ForgetPassCodeWidget(this.text, this.callback);

  @override
  State<StatefulWidget> createState() {
    return ForgetPassCodeState();
  }
}

class ForgetPassCodeState extends State<ForgetPassCodeWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child:  new Container(
        height:50.0,
        alignment: Alignment.center,
        child: new Text(
          widget.text,
          style: new TextStyle(
              fontSize: 12.0,
              color: ColorsUtil.hexColor(0xed3830)),
        ),
      ),
      onTap: (){
        if(widget.text.isNotEmpty) {
          widget.callback();
        }
      },
    );
  }

}

/*--------color-----------*/
class ColorsUtil {
  static Color hexColor(int hex, {double alpha = 1}) {
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    return Color.fromRGBO((hex & 0xFF0000) >> 16, (hex & 0x00FF00) >> 8,
        (hex & 0x0000FF) >> 0, alpha);
  }
}