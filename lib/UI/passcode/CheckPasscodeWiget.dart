import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yamagatabank_flutter/UI/passcode/passcode_input.dart';
import 'key_down_event.dart';
import 'passcode_keyboard.dart';

class CheckPasscodeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CheckPasscodeState();
  }
}

class CheckPasscodeState extends State<CheckPasscodeWidget> {
  List<String> dateList = List();

  /// 验证码键盘的整体回调，根据不同的按钮事件来进行相应的逻辑实现
  void _onKeyDown(KeyDownEvent data) {
    if (data.key != "ok" && data.key != "close") {
      if (data.key == "del" && dateList.length > 0) {
        dateList.removeLast();
      } else if (data.key != "del") {
        if (dateList.length < 6) {
          dateList.add(data.key);

          if (dateList.length == 6 && data.key != "cancle") {
            var newText = dateList
                .toString()
                .replaceAll(",", "")
                .replaceAll("[", "")
                .replaceAll("]", "")
                .replaceAll(" ", "");
            if (newText.length == 6) {
//              String passCode = MinefocusBase.getInstance()
//                  .storage
//                  .getFromSp(key: 'passCode');
            String passCode =  SpUtil.getString('passCode');
              if (newText == passCode) {
                var now = DateTime.now();
                String time = now.millisecondsSinceEpoch.toString();
//                MinefocusBase.getInstance()
//                    .storage
//                    .setToSp(key: 'time1', value: time);
                SpUtil.putString('time1',time);
                Navigator.pop(context);
              } else {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return CupertinoAlertDialog(
                        title: Text('パスワード入力エラー'),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            child: Text('YES'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              dateList.clear();
                              setState(() {});
                            },
                          ),
                        ],
                      );
                    });
              }
            }
          }
        }
      }

      ///清除所有数字
      if (data.key == "cancle" && dateList.length > 0) {
        dateList.clear();
      }
    } else if (data.key == "close") {
      print('忘记密码');
    } else {
      return;
    }
    setState(() {});
  }

  //刷新密码展示控件
  List<Widget> loadView() {
    List<Widget> list = new List();
    for (int i = 0; i < 6; i++) {
      if (i < dateList.length) {
        list.add(passcodeInputWiget(isShow: true));
      } else {
        list.add(passcodeInputWiget(isShow: false));
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: true, //设置弹出软键盘Scaffold不重新绘制
      appBar: AppBar(
        elevation: 0, // 隐藏阴影
        leading: Container(),
      ),
      body: SafeArea(
        child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 30,
                    width:  MediaQuery.of(context).size.width,
                    child: Text(
                      'パスコード入力',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorsUtil.hexColor(0x000000),
                        fontSize: 24,
                        fontFamily: 'Mainfonts',
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 35,
                    width: 210,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      children: loadView(),
                    )),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 20,
                  child: Text(
                    'パスコードを入力してください',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorsUtil.hexColor(0xed3830),
                      fontSize: 12,
                      fontFamily: 'Mainfonts',
                    ),
                  ),
                ),
              ],
            )),
      ),
      bottomNavigationBar: PassCodeKeyboard("パスワードを忘れた場合", _onKeyDown),
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
