

import 'package:flutter/material.dart';
import 'package:ycflutter/api/AndroidApi.dart';
import 'package:ycflutter/api/HttpUtils.dart';
import 'package:ycflutter/common/Constants.dart';
import 'package:ycflutter/pages/home/ArticleItem.dart';
import 'package:ycflutter/weight/BannerView.dart';
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
class HomePage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<HomePage> {

  List listData = new List();
  var bannerData;
  var curPage = 0;
  var listTotalSize = 0;

  ScrollController scrollController = new ScrollController();
  TextStyle titleTextStyle = new TextStyle(fontSize: 15.0);
  TextStyle subtitleTextStyle = new TextStyle(color: Colors.blue, fontSize: 12.0);

  BannerView bannerView;

  //这个方法必须写
  @override
  Widget build(BuildContext context) {
    var isEmpty = listData.isEmpty;
    if(listData == null){
      //展示progress
      return new Center(
        child: new CircularProgressIndicator(),
      );
    }else{
      Widget listView = new ListView.builder(
        itemCount: listData.length + 1,
        itemBuilder: (context, i) => buildItem(i),
        controller: scrollController,
      );
      return new RefreshIndicator(child: listView, onRefresh: pullToRefresh);
    }
  }

  //构造方法
  HomeState(){
    addListener();
  }

  //初始化操作
  @override
  void initState() {
    super.initState();
    getBanner();
    getHomeList();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void addListener() {
    //添加滚动监听事件
    scrollController.addListener(() {
      var maxScroll = scrollController.position.maxScrollExtent;
      var pixels = scrollController.position.pixels;
      if (maxScroll == pixels && listData.length < listTotalSize) {
        getHomeList();
      }
    });
  }

  //刷新控件
  Future<Null> pullToRefresh() async {
    curPage = 0;
    getBanner();
    getHomeList();
    return null;
  }


  //获取轮播图
  void getBanner() {
    String bannerUrl = AndroidApi.BANNER;
    //请求接口
    HttpUtils.get(bannerUrl, (data) {
      if (data != null) {
        setState(() {
          bannerData = data;
          bannerView = new BannerView(bannerData);
        });
      }
    });
  }


  //获取主页数据
  void getHomeList() {
    String url = AndroidApi.ARTICLE_LIST;
    url += "$curPage/json";
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
    });
  }


  Widget buildItem(int i) {
    if (i == 0) {
      return new Container(height: 180.0, child: bannerView,);
    }
    i -= 1;
    var itemData = listData[i];
    if (itemData is String && itemData == Constants.complete) {
      return new EndLine();
    }
    return new ArticleItem(itemData);
  }

}

