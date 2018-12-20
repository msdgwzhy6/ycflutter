

import 'package:flutter/material.dart';
import 'package:ycflutter/api/AndroidApi.dart';
import 'package:ycflutter/api/HttpUtils.dart';
import 'package:ycflutter/common/Constants.dart';
import 'package:ycflutter/pages/detail/ArticleDetailPage.dart';
import 'package:ycflutter/pages/home/ArticleItem.dart';
import 'package:ycflutter/res/YcColors.dart';
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
    //不要用下面这个方式判空
    //var isEmpty = listData.isEmpty;
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
    //添加header头部
    if (i == 0) {
      return addHeader(i);
    }
    i -= 1;
    var itemData = listData[i];
    //添加没有更多
    if (itemData is String && itemData == Constants.complete) {
      return new EndLine();
    }
    //添加博文item
    return new ArticleItem(itemData);
  }

  Widget addHeader(int i) {
    var container = new Container(height: 180.0, child: bannerView,);
    Row content = new Row(
      children: <Widget>[
        new Text('潇湘剑雨：'),
        new Expanded(
          child: new Text(
            'wanAndroid最新博文',
            softWrap: true,
            style: new TextStyle(color: YcColors.colorIndigo),
            textAlign: TextAlign.left,
            maxLines: 1,
          ),
        ),
      ],
    );
    //return content;
    Column column = new Column(
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.all(0.0),
          child: container,
        ),
        new Padding(
          padding: EdgeInsets.fromLTRB(5.0, 15.0, 0.0, 15.0),
          child: content,
        ),
      ],
    );
    return new Card(
      elevation: 0.1,
      child: new InkWell(
        child: column,
        onTap: () {
          Navigator
              .of(context)
              .push(new MaterialPageRoute(builder: (context) {
            return new ArticleDetailPage(
              title: '潇湘剑雨',
              url: 'https://github.com/yangchong211/YCBlogs',
            );
          }));
        },
      ),
    );
  }

}

