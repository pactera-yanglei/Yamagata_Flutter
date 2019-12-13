import 'package:flutter/material.dart';

class passcodeInputWiget extends StatelessWidget{
  final bool isShow;

  passcodeInputWiget({Key key, @required this.isShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return this.isShow?_showWidget():_hidWidget();
  }
}

//已输入展示
class _showWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 35,
      height: 35,
      child: Container(
        margin: EdgeInsets.all(10),
        width: 15,
        height: 15,
        decoration: BoxDecoration(
            color: ColorsUtil.hexColor(0xed3830),
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
    );
  }
}

//未输入展示
class _hidWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 35,
      height: 35,
      child: Container(
        margin: EdgeInsets.all(10),
        width: 15,
        height: 15,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: ColorsUtil.hexColor(0xe5e5e5), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
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
