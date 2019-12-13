import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minefocus_base_flutter/minefocus_base_flutter.dart';
import 'add_view.dart';

class DeleteView extends StatefulWidget {
  @override
  _DeleteViewState createState() => _DeleteViewState();
}

class _DeleteViewState extends State<DeleteView> {

  String spKey = '';
  String kcKey = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('delete'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Text('用于删除数据',
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
            SizedBox(height: 30,),
            RaisedButton(
              child: Text('delete'),
              onPressed: () async {
                bool canPop = false;
                final store = MinefocusBase.getInstance().storage;
                if (spKey.isNotEmpty && store.containsKeyFromSp(key: spKey)) {
                  store.removeFromSp(key: spKey);
                  canPop = true;
                }
                if (kcKey.isNotEmpty && await store.containsKeyFromKc(key: kcKey)) {
                  await store.removeFromKc(key: kcKey);
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
