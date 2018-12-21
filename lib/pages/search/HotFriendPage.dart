import 'package:flutter/material.dart';
import 'package:ycflutter/api/AndroidApi.dart';
import 'package:ycflutter/api/HttpUtils.dart';
import 'package:ycflutter/pages/detail/ArticleDetailPage.dart';
import 'package:ycflutter/pages/search/SearchPage.dart';
import 'package:ycflutter/res/YcColors.dart';

/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2018/11/18
 *     desc  : 热门搜索页面
 *     revise:
 * </pre>
 */
class HotFriendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HotPageState();
  }
}

class HotPageState extends State<HotFriendPage> {
  
  List<Widget> hotWidgets = new List();
  List<Widget> friendWidgets = new List();

  @override
  void initState() {
    super.initState();
    //获取常用网站
    getFriendNet();
    //获取热门关键字
    getHotKeywords();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new Padding(
            padding: EdgeInsets.all(10.0),
            child: new Text('大家都在搜',
                style: new TextStyle(color: YcColors.colorPrimary, fontSize: 16.0))),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: hotWidgets,
          ),
        ),
        new Padding(
            padding: EdgeInsets.all(10.0),
            child: new Text('常用网站',
                style: new TextStyle(color: YcColors.colorPrimary, fontSize: 16.0))),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: friendWidgets,
          ),
        ),
      ],
    );
  }

  //获取常用网站
  void getFriendNet() {
    HttpUtils.get(AndroidApi.FRIEND, (data) {
      setState(() {
        List datas = data;
        friendWidgets.clear();
        for (var itemData in datas) {
          Widget actionChip = new ActionChip(
              backgroundColor: YcColors.colorPrimary,
              padding: EdgeInsets.all(1.0),
              label: new Text(
                itemData['name'],
                style: new TextStyle(color: YcColors.colorWhite , fontSize: 12),
              ),
              onPressed: () {
                itemData['title'] = itemData['name'];
                Navigator
                    .of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new ArticleDetailPage(
                      title: itemData['title'], url: itemData['link']);
                }));
              });
          friendWidgets.add(actionChip);
        }
      });
    });
  }

  //获取热门关键字
  void getHotKeywords() {
    HttpUtils.get(AndroidApi.HOT, (data) {
      setState(() {
        List dataHot = data;
        hotWidgets.clear();
        for (var value in dataHot) {
          Widget actionChip = new ActionChip(
              backgroundColor: YcColors.colorPrimary,
              padding: EdgeInsets.all(1.0),
              label: new Text(
                value['name'],
                style: new TextStyle(color: YcColors.colorWhite , fontSize: 12),
              ),
              onPressed: () {
                Navigator
                    .of(context)
                    .pushReplacement(new MaterialPageRoute(builder: (context) {
                  return new SearchPage(value['name']);
                }));
              });
          hotWidgets.add(actionChip);
        }
      });
    });
  }
}
