import 'package:flutter/material.dart';
import 'package:minefocus_base_flutter/minefocus_base_flutter.dart';
import 'home.dart';

void main() async {
  await MinefocusBase.getInstance().init('');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageView(),
    );
  }
}


