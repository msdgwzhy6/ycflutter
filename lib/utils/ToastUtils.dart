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

  static showToast(String msg) {
    if(scaffoldKey==null){
      scaffoldKey = new GlobalKey<ScaffoldState>();
    }
    scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(msg)));
  }

}