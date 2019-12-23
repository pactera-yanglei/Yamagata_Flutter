import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';



class CostomRadioButton extends StatefulWidget {
  final List listWiget;
  final CostomRadioButtonCallback _costomRadioButtonCallback;


  CostomRadioButton(this.listWiget,this._costomRadioButtonCallback);
//  const CostomRadioButton({Key key, this.listWiget}) : super(key: key);

  @override
  _CostomRadioButtonState createState() => _CostomRadioButtonState();
}


abstract class CostomRadioButtonCallback{
  void onRadioButtonCallback(String chooseValue,int chooseType);
}
//typedef void CostomRadioButtonCallback(chooseValue);

class _CostomRadioButtonState extends State<CostomRadioButton> {
  int groupValue = 0;

  Widget setRadioButton(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(5.0),
      //一行多少个
      crossAxisCount: 3,
      //滚动方向
      scrollDirection: Axis.vertical,
      // 左右间隔
      crossAxisSpacing: 7.0,
      // 上下间隔
      mainAxisSpacing: 10.0,
      //宽高比
      childAspectRatio: 1 / 0.4,
      shrinkWrap: true,
//    children: widget.formList.map((value) {
      children: widget.listWiget.map((value) {
        return listitem(context, value);
      }).toList(),
    );
  }

  void updateGroupValue(int v) {
    print(v);
    setState(() {
      groupValue = v;
    });
  }

  Widget listitem(context, value) {
    var deviceSize = MediaQuery.of(context).size;
//    print(value['type']);
    return groupValue != value['type']
        ? GestureDetector(
            onTap: () {
//              Fluttertoast.showToast(
//                msg: '切换${value}',
//                toastLength: Toast.LENGTH_SHORT,
//                gravity: ToastGravity.BOTTOM,
//                timeInSecForIos: 1,
//              );
              widget._costomRadioButtonCallback.onRadioButtonCallback(value['title'],value['type']);
              updateGroupValue(value['type']);
            },
            child: Container(
            alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                color: Colors.white,
                border: Border.all(
                  color: Colors.red,
                  width: 1.0,
                ),
              ),
              child: Text(
                value['title'],
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    letterSpacing: 1,
                    wordSpacing: 2,
                    height: 1.2,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          )
        : GestureDetector(
            onTap: () {
//              Fluttertoast.showToast(
//                msg: '切换${value}',
//                toastLength: Toast.LENGTH_SHORT,
//                gravity: ToastGravity.BOTTOM,
//                timeInSecForIos: 1,
//              );
              updateGroupValue(value['type']);
              widget._costomRadioButtonCallback.onRadioButtonCallback(value['title'],value['type']);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                color: Colors.red,
              ),
              child: Text(
                value['title'],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    letterSpacing: 1,
                    wordSpacing: 2,
                    height: 1.2,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return setRadioButton(context);
  }
}
