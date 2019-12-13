import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minefocus_base_flutter/minefocus_base_flutter.dart';
import 'delete_view.dart';
import 'add_view.dart';

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();

}

class _HomePageViewState extends State<HomePageView> with WidgetsBindingObserver {

  List<String> spList = new List<String>();
  List<String> kcList = new List<String>();

 // AppLifecycleState _state;

  @override
  void initState() {
    super.initState();
    reloadData();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //_state = state;
    print("state is --> : $state");
  }

  Future<void> reloadData() async {
    spList.clear();
    kcList.clear();

    final storge = MinefocusBase.getInstance().storage;
    final keys = storge.getKeysFromSp();
    keys.forEach((key) {
      final value = storge.getFromSp(key: key);
      spList.add('key: $key\nvalue: $value');
    });

    final maps = await storge.readAllFromKc();
    print('mapsis-----$maps');
    maps.forEach((key, dValue) {
      try {
        final value = EncrypterUtil.decrypt(dValue);
        kcList.add('key: $key\nvalue: $value');
      } catch (e) {
        print('error is ---$e');
      }
    });
    print(AppInfo.getInstance().packageName);
    setState(() {});
    return;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('test'),
        leading: RaisedButton(
          child: Text('delete'),
          color: Colors.transparent,
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return DeleteView();
                })
            ).then((value) {
              reloadData();
            });
          },
        ),
        trailing: RaisedButton(
          child: Text('add'),
          color: Colors.transparent,
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return AddView();
                })
            ).then((value) {
              reloadData();
            });
          },
        )
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 30,),
            Text('sharePreferences', style: TextStyle(fontSize: 20, color: Colors.red),),
            Column(
                children: spList.map((value) {
                  return Container(
                    child: Text(value),
                    margin: EdgeInsets.all(5),
                  );
                }).toList(),
                crossAxisAlignment: CrossAxisAlignment.start
            ),
            SizedBox(height: 30,),
            Text('keychain', style: TextStyle(fontSize: 20, color: Colors.red),),
            Column(
                children: kcList.map((value) {
                  return Container(
                    child: Text(value),
                    margin: EdgeInsets.all(5),
                  );
                }).toList(),
                crossAxisAlignment: CrossAxisAlignment.start
            ),
          ],
        ),
      ),
    );
  }
}

