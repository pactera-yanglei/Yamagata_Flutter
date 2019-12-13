import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class EditWidget extends StatefulWidget {
  @override
  _EditWidgetState createState() => _EditWidgetState();
}

class _EditWidgetState extends State<EditWidget> {
  final String mUserName = "userName";
  bool bl = true;
  List list = ['1231', '123', '123123', '12312'];
  List list1 = [];
  List list2=[];
  String  userName1;
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
  Widget build(BuildContext context) {
    list1=list;
    Future<List> get() async {
      List QC =[];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      QC = prefs.getStringList(mUserName);
      return QC;
    }
    Future<List> Ylist = get();
    List YY =
//    print(list2);
    // TODO: implement build
    list1 = bl ? list : list2;
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(
          'お気に入り設定',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
        ),
      ),
      body: Container(
          child: ReorderableListView(
              children: list1
                  .map((m) => ListTile(
                        key: ObjectKey(m),
                        title: Text(m),
                      ))
                  .toList(),
              onReorder: _onReorder)),
    );
  }

  _onReorder(int oldIndex, int newIndex) {
//    List HC =[];
    save(String mUserName,List list1) async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList(mUserName, list1);
    }
    print('oldIndex: $oldIndex , newIndex: $newIndex');
    setState(() {
      if (newIndex == list1.length) {
        newIndex = list1.length - 1;
      }
      var item = list1.removeAt(oldIndex);
      list1.insert(newIndex, item);
      save(mUserName,list1);
    });
  }

}
