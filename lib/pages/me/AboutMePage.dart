import 'package:flutter/material.dart';
import 'package:ycflutter/pages/detail/ArticleDetailPage.dart';
import 'package:ycflutter/res/YcColors.dart';

/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2018/9/12
 *     desc  : 关于我的页面
 *     revise:
 * </pre>
 */
class AboutMePage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new AboutMeState();
  }
}

class AboutMeState extends State<AboutMePage> {
  @override
  Widget build(BuildContext context) {
    Widget icon = initImage();
    Widget about = initAboutWidget();
    Widget api = initApiWidget();
    Widget zhy = initZhyWidget();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('关于'),
      ),
      body: new ListView(
        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        children: <Widget>[
          icon,
          about,
          api,
          new ListTile(
              title: const Text('直接微信搜索‘鸿洋’关注即可'),
              subtitle: const Text('一个长期分享Android相关的技术干货，质量也很高，值得程序员每天看看'),
              trailing:  Icon(Icons.arrow_forward, color: YcColors.colorPrimary),
              onTap: () {
                Navigator
                    .of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new ArticleDetailPage(
                    title: '鸿洋公众号',
                    url: 'http://www.wanandroid.com',
                  );
                }));
              }),
          zhy,
        ],
      ),
    );
  }

  Widget initImage() {
    Widget icon = new Image.asset(
      'lib/image/zhy.jpg',
      width: 150.0,
      height: 150.0,
    );
    return icon;
  }

  Widget initAboutWidget() {
    Widget layout = new ListTile(
        title: const Text('关于项目'),
        subtitle: const Text('在学习Flutter的时候写的练手项目，用的是鸿洋大神的开发接口，模仿WanAndroid客户端，实现了其大部分的功能效果，后期慢慢完善'),
        trailing:  Icon(Icons.arrow_forward, color: YcColors.colorPrimary),
        onTap: () {
          Navigator
              .of(context)
              .push(new MaterialPageRoute(builder: (context) {
            return new ArticleDetailPage(
              title: 'WanAndroid_Flutter版',
              url: 'https://github.com/yangchong211',
            );
          }));
        });
    return layout;
  }

  Widget initApiWidget() {
    Widget layout = new ListTile(
        title: const Text('关于开放Api接口'),
        subtitle: const Text('玩Android 开放API'),
        trailing:  Icon(Icons.arrow_forward, color: YcColors.colorPrimary),
        onTap: () {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return new ArticleDetailPage(
              title: '张鸿洋的学习网站',
              url: 'http://www.wanandroid.com',
            );
          }));
        });
    return layout;
  }


  Widget initZhyWidget() {
    Widget layout = new ListTile(
        title: const Text('保存鸿洋公众号到本地'),
        trailing:  Icon(Icons.arrow_forward, color: YcColors.colorPrimary),
        onTap: () {

        });
    return layout;
  }
}