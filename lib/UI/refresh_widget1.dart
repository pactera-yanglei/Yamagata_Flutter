import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list = List();
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _refresh();
    _scrollController = ScrollController()
      ..addListener(() {
        //判断是否滑到底
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
//          _loadMore();
          _refresh();
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Future _loadMore() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        list.addAll(
            List.generate(Random().nextInt(5) + 1, (i) => 'more Item $i'));
      });
    });
  }

  Future<void> _refresh() async {
//    await Future.delayed(Duration(seconds: 3), () {
//      setState(() {
//        list = List.generate(Random().nextInt(20) + 15, (i) => 'Item $i');
//      });
//    });
    var url =
        'https://v.juhe.cn/toutiao/index?type=shishang&key=483294d5e9b2202317817d0696b47a58';
//        "https://api.douban.com/v2/movie/$movieType?start=$start&count=$pageSize";
    Dio dio = new Dio();
    Response response = await dio.get(url);
    Map dataMap = response.data;
    var s = dataMap['result']['data'];
    print('$s');
    setState(() {
      movieList.addAll( dataMap['result']['data']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: RefreshIndicator(
            displacement: 10.0,
            child: movieList == null || movieList.isEmpty
                ? Center(
              child: CircularProgressIndicator(),
            )
                : ListView.builder(
              padding: EdgeInsets.all(0),
                controller: _scrollController,
                itemCount: movieList.length + 1,
                itemBuilder: (context, index) {
                  if(index == movieList.length){
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.red,
                        ),
                      ),
                    );


                  }
                  return renderRow(index, context);
                }),
            onRefresh: _refresh),
      ),
    );
  }

  List movieList = new List();
  TextStyle titleStyle =
  new TextStyle(color: const Color(0xFF757575), fontSize: 14.0);
  renderRow(index, context) {
    var movie = movieList[index];
    var title = movie["title"];
    var type = movie["category"];
    var year = movie["date"];
    var score = 5;
    return new Container(
        height: 130,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            new InkWell(
              onTap: () {
//            Navigator.of(context).push(new MaterialPageRoute(
//                builder: (ctx) => new MovieDetail(movieId: id)));
              },
              child: new Column(
                children: <Widget>[
                  new Container(
                    height: 129,
                    // color: Colors.blue,
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          width: 70.0,
                          height: 70.0,
                          margin: const EdgeInsets.all(10.0),
                          child: Image.network(movie["thumbnail_pic_s"]),
                        ),
                        Expanded(
                          child: new Container(
                            height: 110.0,
                            margin: const EdgeInsets.all(12.0),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text(
                                  "电影名称：$title",
                                  style: titleStyle,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                new Text(
                                  "电影类型：$type",
                                  style: titleStyle,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                new Text(
                                  "上映年份：$year",
                                  style: titleStyle,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                new Text(
                                  "豆瓣评分：$score",
                                  style: titleStyle,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //分割线
                  new Divider(height: 1)
                ],
              ),
            ),
           Container(
             height: 50,
             child:  Row(
               children: <Widget>[
                 Expanded(flex: 1,child: Container()),

                 Container(
//                   width: 50,
//                   height: 50,
                   child: Image.asset('images/icon_new.png'),
                 )
               ],
             ),
           )
          ],
        ));
  }
}
