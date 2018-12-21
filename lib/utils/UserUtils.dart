import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';


/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2018/11/15
 *     desc  : 用户处理相关工具类
 *     revise:
 * </pre>
 */
class UserUtils {

  static final String login = "isLogin";
  static final String username = "userName";

  // 保存用户登录信息，data中包含了userName
  static Future saveLoginInfo(String userName) async {
    print('isLogin');
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString(username, userName);
    await sp.setBool(login, true);
  }

  //清除用户登陆的信息
  static Future clearLoginInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    print('clean');
    return sp.clear();
  }

  //获取用户名
  static Future<String> getUserName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(username);
  }

  //判断是否登陆
  static Future<bool> isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool b = sp.getBool(login);
    return true == b;
  }
}
