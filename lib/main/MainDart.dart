import 'package:flutter/material.dart';
import 'package:ycflutter/pages/find/FindPage.dart';
import 'package:ycflutter/pages/home/HomePage.dart';
import 'package:ycflutter/pages/me/MePage.dart';
import 'package:ycflutter/pages/search/SearchPage.dart';
import 'package:ycflutter/pages/todo/TodoPage.dart';
import 'package:ycflutter/res/YcColors.dart';


class MainDart extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    MainDartState mainDartState = new MainDartState();
    return mainDartState;
  }
}

class MainDartState extends State<MainDart> with TickerProviderStateMixin {

  //默认索引
  int positionIndex = 0;
  //底部导航栏
  var mainTitles = ['首页', '发现','其他', '我的'];
  var indexStack;
  List<BottomNavigationBarItem> navigationViews;
  final navigatorKey = GlobalKey<NavigatorState>();

  //重写该方法，初始化作用
  @override
  Widget build(BuildContext context) {
    initData();
    return new MaterialApp(
      navigatorKey: navigatorKey,
      //设置主题
      theme: ThemeData(
          accentColor: Colors.black,
          textSelectionColor: YcColors.colorWhite,
          primaryColor: YcColors.colorPrimary),

      //设置home
      home: new Scaffold(
        //设置appBar
        appBar: new AppBar(
          //title
          title: new Text(
            mainTitles[positionIndex],
            style: new TextStyle(color: Colors.white , fontSize: 18 , fontWeight: FontWeight.bold),
          ),

          //这个相当于actionBar上的menu
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.account_balance),
                onPressed: () {
                  navigatorKey.currentState.push(new MaterialPageRoute(builder: (context) {
                    return null;
                  }));
                }),
            new IconButton(
                icon: new Icon(Icons.add_a_photo),
                onPressed: () {
                  navigatorKey.currentState.push(new MaterialPageRoute(builder: (context) {
                    return null;
                  }));
                }),
            new IconButton(
                icon: new Icon(Icons.search),
                onPressed: () {
                  navigatorKey.currentState.push(new MaterialPageRoute(builder: (context) {
                    return new SearchPage(null);
                  }));
                }),
          ],
        ),
        body: indexStack,

        //相当于底部导航栏
        bottomNavigationBar: new BottomNavigationBar(
          items: navigationViews.map((BottomNavigationBarItem navigationView) => navigationView).toList(),
          currentIndex: positionIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              positionIndex = index;
            });
          },
        ),
      ),
    );
  }

  //这个方法
  @override
  void initState() {
    super.initState();
    navigationViews = <BottomNavigationBarItem>[
      new BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        title: new Text(mainTitles[0]),
        backgroundColor: Colors.black,
      ),
      new BottomNavigationBarItem(
        icon: const Icon(Icons.assignment),
        title: new Text(mainTitles[1]),
        backgroundColor: Colors.black,
      ),
      new BottomNavigationBarItem(
        icon: const Icon(Icons.devices_other),
        title: new Text(mainTitles[2]),
        backgroundColor: Colors.black,
      ),
      new BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        title: new Text(mainTitles[3]),
        backgroundColor: Colors.black,
      ),
    ];
  }


  //初始化数据
  void initData() {
    indexStack = new IndexedStack(
      children: <Widget>[new HomePage(), new FindPage(),new TodoPage(), new MePage()],
      index: positionIndex,
    );
  }

}
