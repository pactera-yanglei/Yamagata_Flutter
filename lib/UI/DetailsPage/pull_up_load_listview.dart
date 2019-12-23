import 'package:flutter/material.dart';

import '../DetailsPage/cost_detail_item.dart';
import 'mock_data.dart';

//import 'package:fluttertoast/fluttertoast.dart';

String searchKey;

class PullUpLoadMoreList extends StatefulWidget {
//  const PullUpLoadMoreList({Key key}) : super(key: key);
  PullUpLoadMoreList(searchKey);

  _PullUpLoadMoreListState _pullUpLoadMoreListState =
      _PullUpLoadMoreListState();

  refreshSearchKey(String key) {
    searchKey = key;
    _pullUpLoadMoreListState.refreshSearchData(searchKey);
  }

  @override
  _PullUpLoadMoreListState createState() => _pullUpLoadMoreListState;
}

class _PullUpLoadMoreListState extends State<PullUpLoadMoreList> implements ListItemRefeshCallback{
  bool isLoading = false;
  ScrollController scrollController = ScrollController();
  List<CostDetailModel> list = List.from(newsList);

  void refreshSearchData(String key) {
    print("刷新索引值为 : ${key}");
//    Fluttertoast.showToast(
//      msg: "刷新索引值为 : ${key}",
//      toastLength: Toast.LENGTH_SHORT,
//      gravity: ToastGravity.BOTTOM,
//      timeInSecForIos: 1,
//    );

    setState(() {
      isLoading = false;
      scrollController.animateTo(0.0, duration: Duration(milliseconds: 50), curve: Curves.easeOut);
      initData(key);
    });
  }

  List<CostDetailModel> initData(String key) {
    if(list != null || list.length > 0){
      list.clear();
    }
    return list = List.from(newsList);
  }

  @override
  void initState() {
    formatData(initData(searchKey));

    super.initState();
    this.scrollController.addListener(() {
      if (!this.isLoading &&
          this.scrollController.position.pixels >=
              this.scrollController.position.maxScrollExtent) {
        setState(() {
          this.isLoading = true;
          this.loadMoreData();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    this.scrollController.dispose();
  }

  List<CostDetailModel> formatData(List<CostDetailModel> list) {
    //设置标题头显示标识
    for (int i = 0; i < list.length; i++) {
      if (i == 0) {
        list[i].isHead = true;
      } else {
        if (list[i].mMonth != list[i - 1].mMonth) {
          list[i].isHead = true;
        } else {
          list[i].isHead = false;
        }
      }
    }
    return list;
  }

  Future loadMoreData() {
    return Future.delayed(Duration(seconds: 1), () {
      setState(() {
        this.isLoading = false;
        this.list.addAll(formatData(newsList));
      });
    });
  }

  Widget renderBottom() {
    if (this.isLoading) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '努力加载中...',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF333333),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 3),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        child: Text(
          '上拉加载更多',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF333333),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: this.scrollController,
      itemCount: this.list.length + 1,
      separatorBuilder: (context, index) {
        return Divider(height: .5, color: Color(0xFFDDDDDD));
      },
      itemBuilder: (context, index) {
        if (index < this.list.length) {
          return CostDetailItem(data: this.list[index],index: index,listItemRefeshCallback:this);
        } else {
          return this.renderBottom();
        }
      },
    );
  }

  @override
  void onItemRefeshCallback(int index, CostDetailModel data) {
    // TODO: implement onItemRefeshCallback
    setState(() {
      list[index] = data;
    });
  }
}
