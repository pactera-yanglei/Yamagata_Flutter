import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//class tab3Widget1 extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      alignment: Alignment.center,
//      child: Text('タウン情報'),
//    );
//  }
//}


class tab3Widget extends StatefulWidget {
  @override
  tab3WidgetState createState() => new tab3WidgetState();
}

class tab3WidgetState extends State<tab3Widget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: new SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return index < _list.length ?
                        (index % 5 == 0 ? Container(height: 100,child:  Text('list item $index'),)
                            : Container(height: 50,child:  Text('list item $index'),))
                            : MoreWidget(_list.length, _hasMore(), 10);
                    //创建列表项
//                    return new Container(
//                      height: index % 5 == 0 ? 100 : 50,
//                      alignment: Alignment.center,
//                      color: Colors.lightBlue[100 * ((index % 9) + 1)],
//                      child: new Text('list item $index'),
//                    );
                  },
                  childCount: _list.length + 1 //30个列表项
              ),
            ),
//            RefreshIndicator(
//              onRefresh: _onRefresh,
//              displacement: 120.0, /// 默认40， 多添加的80为Header高度
//              child: Consumer<OrderPageProvider>(
//                builder: (_, provider, child) {
//                  return CustomScrollView(
//                    /// 这里指定controller可以与外层NestedScrollView的滚动分离，避免一处滑动，5个Tab中的列表同步滑动。
//                    /// 这种方法的缺点是会重新layout列表
//
//                    key: PageStorageKey<String>("$_index"),
//                    slivers: <Widget>[
//                      SliverOverlapInjector(
//                        ///SliverAppBar的expandedHeight高度,避免重叠
//                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
//                      ),
//                      child
//                    ],
//                  );
//                },
//                child: SliverPadding(
//                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                  sliver: _list.isEmpty ? SliverFillRemaining(child: StateLayout(type: _stateType)) :
//                  SliverList(
//                    delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
//                      return index < _list.length ? (index % 5 == 0 ? OrderItemTag(date: "2019年2月5日", orderTotal: 4) : OrderItem(key: Key('order_item_$index'), index: index, tabIndex: _index,))
//                          : MoreWidget(_list.length, _hasMore(), 10);
//                    },
//                        childCount: _list.length + 1),
//                  ),
//                ),
//              ),
//            )
          ],
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _onRefresh();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(tab3Widget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }


  bool _isLoading = false;
  int _page = 1;
  final int _maxPage = 3;
  int _index = 0;

  List _list = [];

  Future _onRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _page = 1;
        _list = List.generate(10, (i) => 'newItem：$i');
      });
    });
  }

  bool _hasMore(){
    return _page < _maxPage;
  }

  Future _loadMore() async {
    if (_isLoading) {
      return;
    }
    if (!_hasMore()){
      return;
    }
    _isLoading = true;
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _list.addAll(List.generate(10, (i) => 'newItem：$i'));
        _page ++;
        _isLoading = false;
      });
    });
  }
}
class MoreWidget extends StatelessWidget {

  const MoreWidget(this.itemCount, this.hasMore, this.pageSize);

  final int itemCount;
  final bool hasMore;
  final int pageSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          hasMore ? const CupertinoActivityIndicator() : SizedBox(),
          hasMore ? SizedBox(width: 5,) : SizedBox(),
          /// 只有一页的时候，就不显示FooterView了
          Text(hasMore ? '正在加载中...' : (itemCount < pageSize ? '' : '没有了呦~'), style: TextStyle(color: Color(0x8A000000))),
        ],
      ),
    );
  }
}

