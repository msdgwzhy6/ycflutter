import 'package:flutter/material.dart';



/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2018/11/15
 *     desc  : Toast工具类
 *     revise:
 * </pre>
 */
class ToastUtils{

  static GlobalKey<ScaffoldState> scaffoldKey;

  //吐司
  static showToast(String msg) {
    if(scaffoldKey==null){
      scaffoldKey = new GlobalKey<ScaffoldState>();
    }
    scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(msg)));
  }

  //打印日志
  static showPrint(String msg){
    if(msg!=null){
      print("yc---------" + msg);
    }
  }

}