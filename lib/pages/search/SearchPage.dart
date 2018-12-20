

//import 'package:flutter/widgets.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SearchPage extends  StatefulWidget{

  String searchStr;
  SearchPage(this.searchStr);

  @override
  State<StatefulWidget> createState() {
    return new SearchState(searchStr);
  }

}



class SearchState extends State<SearchPage> {
  SearchState(String searchStr);

  @override
  Widget build(BuildContext context) {
    return null;
  }
}