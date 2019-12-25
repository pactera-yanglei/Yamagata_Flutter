import 'package:flutter/material.dart';
import 'package:yamagatabank_flutter/UI/portal/LoginWebView.dart';
import 'package:yamagatabank_flutter/bean/kouzuoBean.dart';
import 'package:yamagatabank_flutter/res/colors.dart';
import 'package:yamagatabank_flutter/routers/fluro_navigator.dart';
import 'package:yamagatabank_flutter/routers/splash_routes.dart';

class Bousehold_Item_Widget extends StatefulWidget {
  @override
  Bousehold_Item_WidgetState createState() => new Bousehold_Item_WidgetState();
}

class Bousehold_Item_WidgetState extends State<Bousehold_Item_Widget> {
  bool isxialadown1 = true;
  bool isxialadown2 = true;
  bool isxialadown3 = true;
  bool isxialadown4 = true;
  List<KouzuoBean> list1 = new List();

  List<KouzuoBean> list2 = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  item('全資産', false,true, false, false, '-834,629', false, true,list1,false),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isxialadown1 = !isxialadown1;
                      });
                    },
                    child: item('銀行口座',false, true, true, false, '52,114', true,
                        isxialadown1,list1,true),
                  ),
//                  isxialadown1 ? Container() : visiblityitem(false, list1),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isxialadown2 = !isxialadown2;
                      });
                    },
                    child: item('クレジットカード・カードローン', true,true, true, false,
                        '-886,743', true, isxialadown2,list2,true),
                  ),
//                  isxialadown2 ? Container() : visiblityitem(true, list2),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isxialadown4 = !isxialadown4;
                      });
                    },
                    child: item(
                        '電子マネー',false, false, true, false, '0', false, isxialadown4,list2,false),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isxialadown3 = !isxialadown3;
                      });
                    },
                    child:
                        item('証券',false,true, true, true, '0', true, isxialadown3,list2,false),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
//              width: MediaQuery.of(context).size.width ,
//              height: MediaQuery.of(context).size.height*0.04,
              child: Image.asset('images/logo_momeytree.png'),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 20.0,
//                  height:(MediaQuery.of(context).size.height-200.0)/12,
//              color: Colors.white,
              padding: EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 20.0,
                    height: (MediaQuery.of(context).size.height - 200.0) / 12,
                    child: MaterialButton(
                        elevation: 0,
                        color: Colors.red,
                        child: Text(
                          '認証エラーまたは追加認証が必要',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (content) {
                            return LoginWeb();
                          }));
//                          DialogPage(context);
//                              DialogPage();
                        }),
//                        ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.95 - 65.0,
                        top: 6.0),
                    child: Image.asset(
                      'images/2.0x/moneytree_btn_blue.png',
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(Bousehold_Item_Widget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void initData() {
    KouzuoBean bean = new KouzuoBean();
    bean.current_balance = '1,000';
    bean.display_name = '広島銀行';
    bean.card_number = '3015900';
    bean.show_name = '普通';
    list1.add(bean);
    KouzuoBean bean1 = new KouzuoBean();
    bean1.current_balance = '15,466';
    bean1.display_name = '住信SBIネット銀行';
    bean1.card_number = '105-6605283';
    bean1.show_name = '代表口座';
    list1.add(bean1);
    KouzuoBean bean2 = new KouzuoBean();
    bean2.current_balance = '35,427';
    bean2.display_name = '三井住友銀行';
    bean2.card_number = '2126043';
    bean2.show_name = '残高別普通(総合)';
    list1.add(bean2);

    KouzuoBean bean3 = new KouzuoBean();
    bean3.current_balance = '-774,190';
    bean3.display_name = 'JCBカード';
    bean3.card_number = '3015900';
    bean3.show_name = '[OS]JCBカード/プラスAMC';
    list2.add(bean3);
    KouzuoBean bean4 = new KouzuoBean();
    bean4.current_balance = '-170,890';
    bean4.display_name = 'ビューカード';
    bean4.card_number = '3015900';
    bean4.show_name = '「ビュー・スイカ」カード';
    list2.add(bean4);
    KouzuoBean bean5 = new KouzuoBean();
    bean5.current_balance = '-17,198';
    bean5.display_name = 'セゾンカード';
    bean5.card_number = '3015900';
    bean5.show_name = 'セゾンゴールド·アメリカン·工キ…';
    list2.add(bean5);
  }
}

class item extends StatefulWidget {
  String text;
  bool isone = true;
  bool istop = true;
  bool isxiala = true;
  bool isxialadown = true;
  bool isbottom = false;
  bool isxialashow = false;
  String money;
  bool isshowerror = false;
  List<KouzuoBean> list = new List();

  item(this.text,this.isone, this.istop, this.isxiala, this.isbottom, this.money,
      this.isshowerror, this.isxialadown,this.list,this.isxialashow);

  @override
  itemState createState() => new itemState();
}

class itemState extends State<item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: widget.istop
                  ? BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))
                  : (widget.isbottom
                      ? BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))
                      : BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0)))),
          child: GestureDetector(
            onTap: () {
              print('====');
              if (widget.isxiala) {
                print('====aa');
              } else {
                print('===ccc=');
                NavigatorUtils.push(context, SplashRouter.seisionPage,
                    replace: false);
              }
            },
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.text,
                      style: TextStyle(
                          fontFamily: 'Mainfonts',
                          fontSize: 15,
                          color: Colours.color_666666),
                    ),
                    Expanded(child: SizedBox())
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '￥',
                      style: TextStyle(
                          fontFamily: 'Mainfonts',
                          fontSize: 26,
                          color: Colours.color_666666),
                    ),
//                    GestureDetector(
//                      onTap: (){ print('====');
//                      },
//                      child:
//                    ),
                    Expanded(child: GestureDetector(onTap: (){
                      if (widget.isxiala) {
                        print('====aa');
                        setState(() {
                          widget.isxialadown = ! widget.isxialadown;
                        });
                      } else {
                        print('===ccc=');
                        NavigatorUtils.push(context, SplashRouter.seisionPage,
                            replace: false);
                      }
                    },child: Container(width: MediaQuery.of(context).size.width*0.35,height: 50,color: Colors.white,),)),

                    Text(
                      widget.money,
                      style: TextStyle(
                        fontFamily: 'Mainfonts',
                        fontSize: 30,
                        color: Colours.color_666666,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                      child: Container(),
                    ),
                    widget.isxiala
                        ? (widget.isxialadown
                            ? Image.asset(
                                "images/ic_down_arrow.png",
                                width: 20,
                                height: 20,
                                fit: BoxFit.fill,
                              )
                            : Image.asset(
                                "images/ic_up_arrow.png",
                                width: 20,
                                height: 20,
                                fit: BoxFit.fill,
                              ))
                        : Image.asset(
                            "images/retern_blue_little.png",
                            width: 15,
                            height: 15,
                            fit: BoxFit.fill,
                          ),
                    SizedBox(
                      width: 10,
                      child: Container(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1,
                  child: !widget.isbottom
                      ? Container(
                          color: Colours.text_gray_c,
                        )
                      : Container(),
                ),
                widget.isshowerror
                    ? GestureDetector(
                        onTap: () {},
                        child: Container(
                          color: Colours.color_fce5e7,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                                child: Container(),
                              ),
                              Text(
                                '最新のデータを取得できませんでした。\nMoneytreeアカウントの接続状況を確認してください。',
                                style: TextStyle(
                                    fontSize: 14, color: Colours.color_b22222),
                              ),
                              SizedBox(
                                height: 10,
                                child: Container(),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(),
                widget.isxialadown ? Container() : widget.isxialashow? visiblityitem(widget.isone, widget.list):Container(),
              ],
            ),
          ),
        ),
      ),
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
  void didUpdateWidget(item oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}

class visiblityitem extends StatefulWidget {
  bool isone = false;
  List<KouzuoBean> list;

  visiblityitem(this.isone, this.list);

  @override
  visiblityitemState createState() => new visiblityitemState();
}

class visiblityitemState extends State<visiblityitem> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(left: 10.0, right: 10, top: 2),
        reverse: false,
        primary: true,
//        itemExtent: 50.0,
        shrinkWrap: true,
        itemCount: widget.list.length,
        cacheExtent: 30.0,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, i) => GestureDetector(
              onTap: () {
                NavigatorUtils.push(context, SplashRouter.seisionPage,
                    replace: false);
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 40,
                          color: Colours.color_e5e5e5,
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                children: <Widget>[
                                  Expanded(child: SizedBox()),
                                  Text(
                                    widget.list[i].display_name,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Mainfonts',
                                        color: Colours.color_666666),
                                  ),
                                  Expanded(child: SizedBox())
                                ],
                              ),
                              Expanded(child: SizedBox())
                            ],
                          ),
                        ),
                        Container(
                          color: Colours.color_fafafa,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 10),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        widget.list[i].show_name,
                                        style: TextStyle(
                                            fontSize: 12,
//                                      fontFamily: 'Mainfonts',
                                            color: Colours.color_666666),
                                      ),
                                      widget.isone
                                          ? Container()
                                          : SizedBox(
                                              height: 5,
                                            ),
                                      widget.isone
                                          ? Container()
                                          : Text(
                                              widget.list[i].card_number,
                                              style: TextStyle(
                                                  fontSize: 12,
//                                      fontFamily: 'Mainfonts',
                                                  color: Colours.color_666666),
                                            ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(),
                                    flex: 1,
                                  ),
                                  Text(
                                    '￥',
                                    style: TextStyle(
                                        fontFamily: 'Mainfonts',
                                        fontSize: 23,
                                        color: Colours.color_666666),
                                  ),
//                        Expanded(child: SizedBox()),
                                  Text(
                                    widget.list[i].current_balance,
                                    style: TextStyle(
                                      fontFamily: 'Mainfonts',
                                      fontSize: 20,
                                      color: Colours.color_666666,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                    child: Container(),
                                  ),
                                  Image.asset(
                                    "images/retern_blue_little.png",
                                    width: 15,
                                    height: 15,
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    width: 10,
                                    child: Container(),
                                  ),
                                  Row(
                                    children: <Widget>[],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
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
  void didUpdateWidget(visiblityitem oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
