

import 'package:flutter/material.dart';

import 'costom_radiobutton.dart';
//import 'package:fluttertoast/fluttertoast.dart';

String costType;
String costDetail;
CostomRadioButton _costomRadioButton;

abstract class ListItemRefeshCallback{
  void onItemRefeshCallback(int index,CostDetailModel data);
}

class CostDetailItem extends StatelessWidget implements CostomRadioButtonCallback{
  final CostDetailModel data;
  final int index;
  final ListItemRefeshCallback listItemRefeshCallback;

  const CostDetailItem({Key key, this.data, this.index,this.listItemRefeshCallback}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    _costomRadioButton  = new CostomRadioButton(list, this);
    return constItem(data, context,listItemRefeshCallback,index);
  }

  @override
  void onRadioButtonCallback(String chooseValue,int chooseType) {
    costType = chooseValue;
  }
}

//花销类型选择
int groupValue = 0;
List list = [
  {"title": "生活費", "type": 0,},//生活费：せいかひ
  {"title": "趣味•娯楽", "type": 1},//兴趣：しゅみ 娱乐：ごらく
  {"title": "交際費", "type": 2},//应酬费：こうさいひ
  {"title": "交通費", "type": 3},//交通费：こうつうひ
  {"title": "衣服•美容", "type": 4},//美容：びよう
  {"title": "健康•医療", "type": 5},//医疗：いりょう
  {"title": "教育•習い事", "type": 6},//教育：きょういく　学习：ならいごと
  {"title": "通信費", "type": 7},//通信费：つうしんひ
  {"title": "住宅•家賃", "type": 8},//住宅：じゅうたく　房租：やちん
];



//列表子项
Widget constItem(CostDetailModel data, BuildContext context,ListItemRefeshCallback listItemRefeshCallback,int index) {
  return Column(
    children: <Widget>[
      data.isHead
          ? Container(
              padding: EdgeInsets.only(left: 15.0, right: 10.0),
              height: 35.0,
              width: MediaQuery.of(context).size.width,
              color: Color.fromRGBO(240, 240, 240, 0.9),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${data.mYear}年${data.mMonth}月",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        letterSpacing: 1,
                        wordSpacing: 2,
                        height: 1.2,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 35.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "入金 ¥${data.mIncomeTotalCost}",
                          style: TextStyle(
                            color: Color.fromRGBO(49, 132, 140, 1),
                            fontSize: 12,
                            letterSpacing: 1,
                            wordSpacing: 2,
                            height: 1.2,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "出金 ¥-${data.mOutlayTotalCost}",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            letterSpacing: 1,
                            wordSpacing: 2,
                            height: 1.2,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Container(),
      GestureDetector(
        onTap: () {
//          Fluttertoast.showToast(
//            msg: "我是 : ${data.mYear} 年 ${data.mMonth} 月 ${data.mDay} 日",
//            toastLength: Toast.LENGTH_SHORT,
//            gravity: ToastGravity.BOTTOM,
//            timeInSecForIos: 1,
//          );

          showDataEditDialog(data, context,listItemRefeshCallback,index);
        },
        child: Container(
          height: 55.0,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 55.0,
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 20.0, right: 15.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        //日期
                        width: 35.0,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(right: 12.0),
                              child: Text(
                                data.mDay,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  letterSpacing: 1,
                                  wordSpacing: 2,
                                  height: 1.2,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "日",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11,
                                  letterSpacing: 1,
                                  wordSpacing: 2,
                                  height: 1.2,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Image.asset(
                        //图片显示
                        //支出
                        data.mCostType == 1
                            ? 'assets/icon/passbook_outlay.png'
                            : 'assets/icon/passbook_income.png',
                        width: 20,
                        height: 20,
                        fit: BoxFit.scaleDown,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Stack(
                        children: <Widget>[
                          Align(
                            alignment: data.mDescribe.length > 0
                                ? Alignment.topLeft
                                : Alignment.centerLeft,
                            child: Container(
                              padding: data.mDescribe.length > 0
                                  ? EdgeInsets.only(top: 10.0)
                                  : EdgeInsets.only(),
                              child: Text(
                                data.mCostDetail,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  letterSpacing: 1,
                                  wordSpacing: 2,
                                  height: 1.2,
                                ),
                              ),
                            ),
                          ),
                          data.mDescribe.length > 0
                              ? Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: 10.0),
                                    child: Row(
                                      children: <Widget>[
                                        Image.asset(
                                          //图片显示
                                          'assets/icon/general_ps.png',
                                          width: 12,
                                          height: 12,
                                          fit: BoxFit.scaleDown,
                                        ),
                                        SizedBox(
                                          width: 2.0,
                                        ),
                                        Text(
                                          data.mDescribe,
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 10,
                                            letterSpacing: 1,
                                            wordSpacing: 2,
                                            height: 1.2,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    //支出
                    data.mCostType == 1 ? "¥-${data.mCost}" : "¥${data.mCost}",
                    style: TextStyle(
                      color: data.mCostType == 1
                          ? Colors.black
                          : Color.fromRGBO(49, 132, 140, 1),
                      fontSize: 14,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

TextEditingController searchController = new TextEditingController();

showDataEditDialog(CostDetailModel data, BuildContext context,ListItemRefeshCallback listItemRefeshCallback,int index) {
  showDialog<Null>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
//        title: Text("SimpleDialog"),
        titlePadding: EdgeInsets.all(10),
        backgroundColor: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(3))),
        children: <Widget>[
          //头
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.all(15.0),
            child: Text(
              "明細メモ入力",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                letterSpacing: 1,
                wordSpacing: 2,
                height: 1.2,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          //花销详细
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 15.0, right: 15.0),
            padding: EdgeInsets.only(bottom: 5.0,left: 10.0,right: 10.0,top: 10.0),
//            height: 50.0,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3.0)),
              color: Color.fromRGBO(240, 240, 240, 0.9),
            ),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '${data.mYear}年${data.mMonth}月${data.mDay}日',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      height: 1.2,
//                    fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            data.mCostType == 1
                                ? 'assets/icon/passbook_outlay.png'
                                : 'assets/icon/passbook_income.png',
                            width: 20,
                            height: 20,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          Text(
                            data.mCostDetail,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              letterSpacing: 1,
                              wordSpacing: 2,
                              height: 1.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        data.mCostType == 1
                            ? '¥-${data.mCost}'
                            : '¥${data.mCost}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          letterSpacing: 1,
                          wordSpacing: 2,
                          height: 1.2,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //输入框提示文字
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Text(
              "メモの内容を選択するか、",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                letterSpacing: 1,
                wordSpacing: 2,
                height: 1.2,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 3.0, left: 10.0),
            child: Text(
              "20文字以内でご入力ください。",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                letterSpacing: 1,
                wordSpacing: 2,
                height: 1.2,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //单选组件
          Container(
            margin: EdgeInsets.only(left: 10.0,right: 10.0),
            width: MediaQuery.of(context).size.width,
            height: 135.0,
            child: _costomRadioButton,
          ),

          //输入框
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            child: TextField(
              onChanged: (val) {
                costDetail = val;
              },
              decoration: InputDecoration(
//                      labelText: "密码",
                hintText: "メモ入力20文字以内",
                border: InputBorder.none
              ),
//                    obscureText: true,assets/icon/general_ps.png
              controller: searchController,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            width: MediaQuery.of(context).size.width,
            height: 1.0,
            color: Colors.red,
          ),

          //操作按钮
          Container(
            height: 40.0,
            margin: EdgeInsets.only(
                left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      child: Text(
                        "キャンセル",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            letterSpacing: 1,
                            wordSpacing: 2,
                            height: 1.2,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
//                      Fluttertoast.showToast(
//                        msg: "点击记录详情",
//                        toastLength: Toast.LENGTH_SHORT,
//                        gravity: ToastGravity.BOTTOM,
//                        timeInSecForIos: 1,
//                      );

                      data.mDescribe = costType+","+costDetail;
                      listItemRefeshCallback.onItemRefeshCallback(index, data);
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        color: Colors.red,
                      ),
                      child: Text(
                        " 登　録 ",//登记：とうろく
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 1,
                            wordSpacing: 2,
                            height: 1.2,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  ).then((val) {
    print(val);
  });
}

class CostDetailModel {
  /// 记录所在年
  final String mYear;

  /// 记录所在月
  final String mMonth;

  /// 记录所在日
  final String mDay;

  /// 支出 : 1/ 收入 : 2
  final int mCostType;

  /// 详情
  final String mCostDetail;

  /// 描述
  String mDescribe;

  /// 数值
  final double mCost;

  /// 月收入总值
  final double mIncomeTotalCost;

  /// 月支出总值
  final double mOutlayTotalCost;

  /// 是否显示头布局
  bool isHead;

  CostDetailModel({
    this.mYear,
    this.mMonth,
    this.mDay,
    this.mCostType,
    this.mCostDetail,
    this.mDescribe,
    this.mCost,
    this.mIncomeTotalCost,
    this.mOutlayTotalCost,
  });
}
