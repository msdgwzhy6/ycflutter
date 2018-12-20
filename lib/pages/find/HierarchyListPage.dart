import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ycflutter/api/AndroidApi.dart';
import 'package:ycflutter/api/HttpUtils.dart';
import 'package:ycflutter/common/Constants.dart';
import 'package:ycflutter/pages/home/ArticleItem.dart';
import 'package:ycflutter/weight/EndLine.dart';

/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2018/8/22
 *     desc  : 首页面
 *     revise:
 * </pre>
 */
class HierarchyListPage extends StatefulWidget {
  
  String id;
  HierarchyListPage(id){
    this.id = id;
  }

  @override
  State<StatefulWidget> createState() {
    return new HierarchyListPageState();
  }
}

class HierarchyListPageState extends State<HierarchyListPage> with AutomaticKeepAliveClientMixin {
  
  @override
  bool get wantKeepAlive => true;
  int curPage = 0;
  Map<String, String> map = new Map();
  List listData = new List();
  int listTotalSize = 0;
  ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    getArticleList();
    //添加滚动监听事件
    addListener();
  }
  
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (listData == null || listData.isEmpty) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      Widget listView = new ListView.builder(
        key: new PageStorageKey(widget.id),
        itemCount: listData.length,
        itemBuilder: (context, i) => buildItem(i),
        controller: scrollController,
      );

      return new RefreshIndicator(child: listView, onRefresh: pullToRefresh);
    }
  }

  void getArticleList() {
    String url = AndroidApi.ARTICLE_LIST;
    url += "$curPage/json";
    map['cid'] = widget.id;
    HttpUtils.get(url, (data) {
      if (data != null) {
        Map<String, dynamic> map = data;
        var _listData = map['datas'];
        listTotalSize = map["total"];
        setState(() {
          List list1 = new List();
          if (curPage == 0) {
            listData.clear();
          }
          curPage++;
          list1.addAll(listData);
          list1.addAll(_listData);
          if (list1.length >= listTotalSize) {
            list1.add(Constants.complete);
          }
          listData = list1;
        });
      }
    }, params: map);
  }

  Future<Null> pullToRefresh() async {
    curPage = 0;
    getArticleList();
    return null;
  }

  Widget buildItem(int i) {
    var itemData = listData[i];
    if (i == listData.length - 1 && itemData.toString() == Constants.complete) {
      return new EndLine();
    }
    return new ArticleItem(itemData);
  }

  void addListener() {
    //添加滚动监听事件
    scrollController.addListener(() {
      var maxScroll = scrollController.position.maxScrollExtent;
      var pixels = scrollController.position.pixels;
      if (maxScroll == pixels && listData.length < listTotalSize) {
        getArticleList();
      }
    });
  }
}
