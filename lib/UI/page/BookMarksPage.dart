import 'package:flutter/material.dart';

import 'EditPage.dart';

class BookMakesState extends StatefulWidget {
  @override
  _BookMakesStateState createState() => _BookMakesStateState();
}

class _BookMakesStateState extends State<BookMakesState> {
  List<String> titleItems = <String>[
    'keyboard',
    'print',
    'router',
    'pages',
    'zoom_out_map',
    'zoom_out',
    'youtube_searched_for',
    'wifi_tethering',
    'wifi_lock',
    'widgets',
    'weekend',
    'web',
    '图accessible',
    'ac_unit',
  ];

  List<Icon> iconItems = <Icon>[
    new Icon(Icons.keyboard),
    new Icon(Icons.print),
    new Icon(Icons.router),
    new Icon(Icons.pages),
    new Icon(Icons.zoom_out_map),
    new Icon(Icons.zoom_out),
    new Icon(Icons.youtube_searched_for),
    new Icon(Icons.wifi_tethering),
    new Icon(Icons.wifi_lock),
    new Icon(Icons.widgets),
    new Icon(Icons.weekend),
    new Icon(Icons.web),
    new Icon(Icons.accessible),
    new Icon(Icons.ac_unit),
  ];

  List<String> subTitleItems = <String>[
    'subTitle: keyboard',
    'subTitle: print',
    'subTitle: router',
    'subTitle: pages',
    'subTitle: zoom_out_map',
    'subTitle: zoom_out',
    'subTitle: youtube_searched_for',
    'subTitle: wifi_tethering',
    'subTitle: wifi_lock',
    'subTitle: widgets',
    'subTitle: weekend',
    'subTitle: web',
    'subTitle: accessible',
    'subTitle: ac_unit',
  ];
  Widget buildListData(BuildContext context, String titleItem, Icon iconItem,
      String subTitleItem) {
    return new ListTile(
      leading: iconItem,
      title: new Text(
        titleItem,
        style: TextStyle(fontSize: 18),
      ),
      subtitle: new Text(
        subTitleItem,
      ),
      trailing: new Icon(Icons.keyboard_arrow_right),
      // 创建点击事件
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return new AlertDialog(
              title: new Text(
                'ListViewAlert',
                style: new TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              ),
              content: new Text('您选择的item内容为:$titleItem'),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _list = new List();
    for (int i = 0; i < titleItems.length; i++) {
      _list.add(buildListData(
          context, titleItems[i], iconItems[i], subTitleItems[i]));
    }
    // TODO: implement build
    return Scaffold(
      body: Container(
//        color: Colors.black12,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Column(
          children: <Widget>[
            Container(

              height: 20.0,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 12,
                    child: Text(
                      'お気に入り情報',
                      style: TextStyle(fontSize: 15.0, color: Colors.black),textAlign: TextAlign.center,
                    ),
                  ),

                  Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context){
                            return EditWidget();
                          }));
                        },
                        child: Text(
                          "編集",
                          style: TextStyle(fontSize: 12.0, color: Colors.blue),textAlign: TextAlign.right,
                        ),
                      ))
                ],
              ),
            ),
            Divider(height: 1.0, indent: 0.0, color: Colors.black12),
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemBuilder: (context, item) {
                  return buildListData(context, titleItems[item],
                      iconItems[item], subTitleItems[item]);
                },
                itemCount: iconItems.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
