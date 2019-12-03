import 'package:flutter/material.dart';
import 'package:yamagatabank_flutter/Bloc/baseBloc.dart';
import 'package:yamagatabank_flutter/UI/page/tabViewWidget.dart';
import 'package:yamagatabank_flutter/UI/tabWidget.dart';
import 'package:yamagatabank_flutter/tab1.dart';
import 'package:yamagatabank_flutter/tab2.dart';
import 'package:yamagatabank_flutter/tab3.dart';

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
    tabWidget(),
    tab1Widget(),
    tab2Widget(),
    tab3Widget(),
  ];
  @override
  void initState(){
    super.initState();
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
}

