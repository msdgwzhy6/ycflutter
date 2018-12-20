

import 'package:flutter/material.dart';

class ArticleItem extends StatefulWidget{

  var itemData;

  ArticleItem(itemData){
    this.itemData = itemData;
  }

  @override
  State<StatefulWidget> createState() {
    return new ArticleView();
  }


}

class ArticleView  extends State<ArticleItem> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }
}
