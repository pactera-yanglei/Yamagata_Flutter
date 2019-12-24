import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/utils/utils.dart';
import 'package:yamagatabank_flutter/UI/page/cityinfomation_page.dart';
import 'package:yamagatabank_flutter/UI/portal/NetbankWebviewWidget.dart';
import 'package:yamagatabank_flutter/UI/portal/PortalWebviewWidget.dart';
import 'package:yamagatabank_flutter/util/apis.dart';

import 'CheckOutTabWidget.dart';

class ETMainTabModel {
  String title;
  String unSelectedImage;
  String selectedImage;

  ETMainTabModel({
    this.title,
    this.unSelectedImage,
    this.selectedImage,
  });
}

class MainTabWidget extends StatefulWidget {
  @override
  MainTabWidgetState createState() => MainTabWidgetState();
}

class MainTabWidgetState extends State<MainTabWidget> {
  ///当前选中项
  int tabbarIndex = 0;

  ///Tab数据Date
  List<ETMainTabModel> tabModelList = [
    ETMainTabModel(
      title: '家計管理',
      unSelectedImage: 'images/ic_record.png',
      selectedImage: 'images/ic_record_click.png',
    ),
    ETMainTabModel(
        title: 'ネットバンク',
        unSelectedImage: 'images/ic_banking.png',
        selectedImage: 'images/ic_banking_clicked.png'),
    ETMainTabModel(
        title: 'ポータル',
        unSelectedImage: 'images/ic_atm.png',
        selectedImage: 'images/ic_atm_clicked.png'),
    ETMainTabModel(
        title: 'タウン情報',
        unSelectedImage: 'images/town_normal.png',
        selectedImage: 'images/town_selected.png')
  ];
  List<Widget> tabPages = [
//    BlocProvider(child: tabWidget(),bloc: Incre,)
    CheckOutTabWidget(),
    NetbankWebviewWidget(),
    PortalWebviewWidget(),
    CityInfomationPage(),
  ];
  @override
  void initState(){
    super.initState();
//    timeget();
//    String time = timeget();
//    print(time);
//    print(getFixLenthString(16));
//    int num = randomNum(10000);
//    String s = shaEncode("AND"+time+getFixLenthString(16) + '$num' + 'hirojima');
//    print("AND"+time+getFixLenthString(16));
//    print(s);
//    print('$num');
  }
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return WillPopScope(child: Scaffold(
      body: IndexedStack(index: tabbarIndex,children:tabPages),
      drawerScrimColor: Colors.red,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: tabModelList.map((model){
          int i =tabModelList.indexOf(model);
          return BottomNavigationBarItem(
            activeIcon: Image.asset(model.selectedImage),
            icon: Image.asset(i==tabbarIndex?model.selectedImage:model.unSelectedImage),
            title: Text(model.title,style: i==tabbarIndex||(model.title=='')?TextStyle(fontSize: 0):
            TextStyle(color: Colors.black,fontSize: 13.0)),
          );
        }).toList(),
        currentIndex: tabbarIndex,
          onTap:onItemTapped,
      ),
    ), onWillPop: (){Future.value(false);});
  }
  void onItemTapped(int index){
    setState((){
      tabbarIndex=index;
    });
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
//    var b = ModalRoute.of(context).isCurrent;
//    print(b);
//    if(b){
//      print('=====');
//      String code = SpUtil.getString('code');
//      String uuid = SpUtil.getString('uuid');
//      timeget();
//      String time = timeget();
//      print(time);
//      print(getFixLenthString(16));
//      int num = randomNum(10000);
//      String s = shaEncode("AND"+time+getFixLenthString(16) + '$num' + 'hirojima');
//      print(s);
//      print('$num');
//      SpUtil.putString('uuid', "AND"+time+getFixLenthString(16));
//      if(code!=''){
//        print('=====aaaa');
//        LoginWithEmail req = LoginWithEmail(email: 'wangcong@1.1', password: 'qwer1234');
//        req.request().then((result){
//          if (result.success) {
//            print('LoginWithEmail data --${result.data}');
//          } else {
//            print('LoginWithEmail  error');
//          }
//        });
//      }
//    }
    super.deactivate();
  }

  String getFixLenthString(int num) {
    Random random= new Random.secure();
    String fixLenthString = ((1 + random.nextDouble()) * pow(10.0, num.toDouble())).toString();
    if(fixLenthString.indexOf(".") > 0){
      int temp = random.nextInt(9);
      fixLenthString = fixLenthString.replaceAll(".", temp.toString());

    }
    if (fixLenthString.indexOf("E") > 0) {
      int temp = random.nextInt(9);
      fixLenthString = fixLenthString.replaceAll("E", temp.toString());
    }
    return fixLenthString.substring(1, num + 1);
  }

  String timeget() {
    String time = DateUtil.getDateStrByDateTime(DateTime.now(),format: DateFormat.NORMAL);
    List<String> ymd = time.split(' ')[0].split('-');
    List<String> hmm = time.split(' ')[1].split(':');
//    return ymd[0]+ymd[1]+ymd[2]+hmm[0]+hmm[1]+hmm[2];

   String a = DateUtil.formatDate(DateTime.now(),isUtc:false,format: 'yyMMdd');
   String b = DateUtil.formatDate(DateTime.now(),isUtc:false,format: 'mmss');
   String c = DateUtil.formatDate(DateTime.now(),isUtc:false,format: 'HH');
   if(int.parse(c)>22){
     c = (int.parse(c)-12).toString();
   }else if(int.parse(c)>12&&int.parse(c)<22){
     c = '0'+ (int.parse(c)-12).toString();
   }
    String d=  DateUtil.formatDate(DateTime.now(),isUtc:false,format: 'yyMMddHHmmss');
    return '$a$c$b';
//    return DateUtil.formatDate(DateUtil.getDateTimeByMs(1576814943),isUtc:false,format: 'yyMMddHHmmss');
  }

  String shaEncode(String st) {
    var bytes = utf8.encode(st);
    var digest = sha1.convert(bytes);
    List<int> a =  digest.bytes;
    String s = '';
    s = hex(a).toLowerCase();


    return '"$s"';
  }

  int randomNum(int i) {Random random= new Random.secure();
  return random.nextInt(i);}


}

