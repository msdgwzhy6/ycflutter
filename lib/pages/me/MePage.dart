//import 'package:flutter/widgets.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ycflutter/pages/detail/ArticleDetailPage.dart';
import 'package:ycflutter/pages/me/AboutMePage.dart';
import 'package:ycflutter/res/YcColors.dart';
import 'package:ycflutter/weight/ItemLine.dart';


/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2018/9/12
 *     desc  : 我的页面
 *     revise:
 * </pre>
 */
class MePage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new MeState();
  }
}


class MeState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    Widget image = initImage();
    var itemLine1 = new ItemLine();
    Widget listAbout = initAboutWidget();
    var itemLine2 = new ItemLine();
    Widget listLogout = initLogoutWidget();
    var itemLine3 = new ItemLine();
    Widget listGit = initGitWidget();
    Widget listBlog = initBlogWidget();


    //将上面创建的view添加到布局中
    return new ListView(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      children: <Widget>[
        image,
        itemLine1,
        listAbout,
        itemLine2,
        listLogout,
        itemLine3,
        listGit,
        listBlog,
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget initImage() {
    Widget image = new Image.asset(
      'lib/image/ic_launcher_round.png',
      width: 120.0,
      height: 120.0,
    );
    return image;
  }

  Widget initAboutWidget() {
    Widget layout = new ListTile(
        leading: const Icon(Icons.info),
        title: const Text('关于更多信息'),
        trailing:  Icon(Icons.arrow_forward, color: YcColors.colorPrimary),
        onTap: () {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return new AboutMePage();
          }));
        });
    return layout;
  }

  Widget initLogoutWidget() {
    Widget layout = new ListTile(
        leading: const Icon(Icons.account_balance_wallet),
        title: const Text('退出登录'),
        trailing:  Icon(Icons.arrow_forward, color: YcColors.colorPrimary),
        onTap: () async {

        });
    return layout;
  }

  Widget initGitWidget() {
    Widget layout = new ListTile(
        leading: const Icon(Icons.crop_original),
        title: const Text('我的GitHub'),
        trailing:  Icon(Icons.arrow_forward, color: YcColors.colorPrimary),
        onTap: () async {
          Navigator
              .of(context)
              .push(new MaterialPageRoute(builder: (context) {
            return new ArticleDetailPage(
              title: '潇湘剑雨',
              url: 'https://github.com/yangchong211',
            );
          }));
        });
    return layout;
  }

  /// 处使化我的博客条目控件
  Widget initBlogWidget() {
    Widget layout = new ListTile(
        leading: const Icon(Icons.ac_unit),
        title: const Text('我的Blog总结'),
        trailing:  Icon(Icons.arrow_forward, color: YcColors.colorPrimary),
        onTap: () {
          Navigator
              .of(context)
              .push(new MaterialPageRoute(builder: (context) {
            return new ArticleDetailPage(
              title: '博客大汇总',
              url: 'https://github.com/yangchong211',
            );
          }));
        });
    return layout;
  }

}