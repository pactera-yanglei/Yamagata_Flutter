import 'package:flutter/material.dart';

class AssetsMainPage extends StatefulWidget{
  @override
  _AssetsMainPageState createState() => _AssetsMainPageState();
}

class _AssetsMainPageState extends State<AssetsMainPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Card(
        child: ListView.builder(
          itemBuilder: (context,index){
            return Container(
              child: ExpansionTile(
//                backgroundColor: Colors.black,
                title: Column(
                  children: <Widget>[
                    Container(
                      child: Text('全資産'),
                    ),
                    Container(
                      child:Row(
                        children: <Widget>[
                          Icon(Icons.attach_money),
                          Icon(Icons.remove),
                          Text('619,488')
                        ],
                      )
                    )
                  ],
                ),
                trailing: Icon(Icons.navigate_next),
              ),
            );
          },

        ),
      ),
    );
  }
}