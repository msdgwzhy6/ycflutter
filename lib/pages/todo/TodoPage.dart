
import 'package:flutter/material.dart';
import 'package:ycflutter/pages/todo/serviceCard.dart';
import 'package:ycflutter/res/YcColors.dart';
import 'package:ycflutter/weight/wallpager/BannerPageView.dart';


/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2018/12/09
 *     desc  : todo页面
 *     revise:
 * </pre>
 */
class TodoPage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new TodoState();
  }
}

class TodoState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    var bannerPageView = new BannerPageView();
    var container = new Container(height: 180.0, child: bannerPageView,);
    return new Scaffold(
        body: new SingleChildScrollView(
          child: new Container(
            color: YcColors.colorWhite,
            child: new Column(
              children: <Widget>[
                container,
                serviceView(context),
              ],
            ),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
  }

}