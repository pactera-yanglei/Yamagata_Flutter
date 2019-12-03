import 'package:flutter/material.dart';
import 'package:yamagatabank_flutter/widgets/progress_widget1.dart';

class ProgressPage extends StatefulWidget {
  @override
  ProgressPageState createState() => new ProgressPageState();
}

class ProgressPageState extends State<ProgressPage> {
  int a=0;
  int b=0;
  int c=0;
  int d=0;
  int e=0;
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body:Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).padding.top,
            color: Color(0xCC004EA2),
          ),
          Expanded(flex:1,child: SizedBox()),
          Padding(
            padding: EdgeInsets.only(left: 30,right: 30),
            child: Container(
              child: Column(
                children: <Widget>[
                  FAProgressBar(
                    currentValue: 100,
                    size: 25,
                    maxValue: 100,
                    changeColorValue: 100,
                    changeProgressColor:  Color(0xFF004EA2),
                    backgroundColor: Colors.grey[300],
                    progressColor: Color(0xFF004EA2),
                    animatedDuration: const Duration(milliseconds: 10000),
                    direction: Axis.horizontal,
                    verticalDirection: VerticalDirection.up,
                    displayText: '%',
                  )
                ],
              ),
            ),
          ),
          Expanded(flex:2,child: SizedBox()),
        ],
      )
    );
  }
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
  void didUpdateWidget(ProgressPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
