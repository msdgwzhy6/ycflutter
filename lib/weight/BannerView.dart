import 'package:flutter/material.dart';
import 'package:ycflutter/pages/detail/ArticleDetailPage.dart';


/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2018/9/11
 *     desc  : 轮播图view
 *     revise:
 * </pre>
 */
class BannerView extends StatefulWidget {

  var data;
  BannerView(data){
    this.data = data;
  }

  @override
  State<StatefulWidget> createState() {
    return new BannerViewState(data);
  }
}

class BannerViewState extends State<BannerView> with SingleTickerProviderStateMixin {
  TabController tabController;
  List data;

  BannerViewState(this.data);

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: data == null ? 0 : data.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    if (data != null && data.length > 0) {
      for (var i = 0; i < data.length; i++) {
        var item = data[i];
        var imgUrl = item['imagePath'];
        var title = item['title'];
        item['link'] = item['url'];
        items.add(new GestureDetector(
            onTap: () {
              onBannerClick(item);
            },
            child: AspectRatio(
              aspectRatio: 2.0 / 1.0,
              child: new Stack(
                children: <Widget>[
                  new Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                    width: 1000.0,
                  ),
                  new Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: new Container(
                      width: 1000.0,
                      color: const Color(0x50000000),
                      padding: const EdgeInsets.all(5.0),
                      child: new Text(title,
                          style: new TextStyle(
                              color: Colors.white, fontSize: 15.0)),
                    ),
                  ),
                ],
              ),
            )));
      }
    }
    return new TabBarView(
      controller: tabController,
      children: items,
    );
  }

  //轮播图点击事件
  //https://github.com/yangchong211/YCBlogs
  void onBannerClick(itemData) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new ArticleDetailPage(title:itemData['title'],url: itemData['link']);
    }));
  }
}
