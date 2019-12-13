import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:minefocus_base_flutter/minefocus_base_flutter.dart';

class AddView extends StatefulWidget {
  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {

  String spKey = '';
  String spValue = '';

  String kcKey = '';
  String kcValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('add'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Text('用于追加数据',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, color: Colors.red),
            ),
            SizedBox(height: 20,),
            Text('sharePreferences', style: TextStyle(fontSize: 20, color: Colors.red),),
            Container(
              child: Row(
                children: <Widget>[
                  Text('key:'),
                  Container(
                    width: screenW(context) - 100,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 10.0,
                        ),
                        hintText: '请输入key',
                        hintStyle: TextStyle(
                          color: Colors.black26,
                          fontSize: 20.0,
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (text) {
                        spKey = text;
                      },
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.all(10),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text('value:'),
                  Container(
                    width: screenW(context) - 100,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 10.0,
                        ),
                        hintText: '请输入value',
                        hintStyle: TextStyle(
                          color: Colors.black26,
                          fontSize: 20.0,
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (text) {
                        spValue = text;
                      },
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.all(10),
            ),
            SizedBox(height: 30,),
            Text('keychain', style: TextStyle(fontSize: 20, color: Colors.red),),
            Container(
              child: Row(
                children: <Widget>[
                  Text('key:'),
                  Container(
                    width: screenW(context) - 100,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 10.0,
                        ),
                        hintText: '请输入key',
                        hintStyle: TextStyle(
                          color: Colors.black26,
                          fontSize: 20.0,
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (text) {
                        kcKey = text;
                      },
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.all(10),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text('value:'),
                  Container(
                    width: screenW(context) - 100,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 10.0,
                        ),
                        hintText: '请输入value',
                        hintStyle: TextStyle(
                          color: Colors.black26,
                          fontSize: 20.0,
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (text) {
                        kcValue = text;
                      },
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.all(10),
            ),
            SizedBox(height: 30,),
            RaisedButton(
              child: Text('save'),
              onPressed: () {
                bool canPop = false;
                final store = MinefocusBase.getInstance().storage;
                if (spKey.isNotEmpty && spValue.isNotEmpty) {
                  store.setToSp(key: spKey, value: spValue);
                  canPop = true;
                }
                if (kcKey.isNotEmpty && kcValue.isNotEmpty) {
                  store.setToKc(key: kcKey, value: kcValue);
                  canPop = true;
                }
                if (canPop) {
                  Navigator.of(context).pop();
                }
              },
            )
          ],
        ),
        margin: EdgeInsets.all(10),
      ),
    );
  }
}


/// screen width
/// 当前屏幕 宽
double screenW(BuildContext context) {
  MediaQueryData mediaQuery = MediaQuery.of(context);
  return mediaQuery.size.width;
}
