
import 'package:flustars/flustars.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class EditWidget extends StatefulWidget {
  @override
  _EditWidgetState createState() => _EditWidgetState();
}

class _EditWidgetState extends State<EditWidget> {
  List<String> list = ['1231', '123', '123123', '12312'];
  List blList = [false, false, false, false];
  List<String> list1 = [];
  List<String> list2 = [];
  List<String> list3 = [];

//  bool onState =false;
  String userName1;

//  bool bl=true;
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
    List<String> YY = SpUtil.getStringList('mUserName');
    // TODO: implement build
    bool bl = SpUtil.getBool('Bl');
    if (YY.length == 0) {
      bl = true;
    }
    list1 = bl ? list : YY;
//    if(bl==false){
//      list1=YY;
//    }else{
//      list1=list;
//    }

    return Scaffold(
      appBar: new AppBar(
        leading: _leading(),
        actions: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text('完了', style: TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.w600),),
              )
          )
        ],
        centerTitle: true,
        title: new Text(
          'お気に入り設定',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
        ),
      ),

      body: Container(
          child: ReorderableListView(
              children: list1
                  .map((m) =>
                  ListTile(
                    key: ObjectKey(m),
                    leading: Container(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            blList[1] = !blList[1];
                          });
                        },
                        child: Icon(blList[1] ? Icons.check_box : Icons
                            .check_box_outline_blank, color: Colors.blue,),
                      ),
                    ),
                    title: Text(m),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.perm_contact_calendar)
                      ],
                    ),
                    trailing: Icon(Icons.drag_handle),
                  )
              ).toList(),

              onReorder: _onReorder
          )
      ),
    );
  }

  _onReorder(int oldIndex, int newIndex) {
    print('oldIndex: $oldIndex , newIndex: $newIndex');
    setState(() {
      if (newIndex == list1.length) {
        newIndex = list1.length - 1;
      }
      var item = list1.removeAt(oldIndex);
      list1.insert(newIndex, item);

      SpUtil.putBool('Bl', false);
      SpUtil.putStringList('mUserName', list1);
    });
  }

  _leading() {
    Container(
      child: Text('キャンセル',
        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),),
    );
  }
}