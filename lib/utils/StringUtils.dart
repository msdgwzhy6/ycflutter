import 'package:flutter/widgets.dart';
import 'package:ycflutter/res/YcColors.dart';


/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2018/11/15
 *     desc  : String工具类
 *     revise:
 * </pre>
 */
class StringUtils {
  // 保存用户登录信息，data中包含了token等信息
  static TextSpan getTextSpan(String text, String key) {
    if (text == null || key == null) {
      return null;
    }
    String splitString1 = "<em class='highlight'>";
    String splitString2 = "</em>";
    String textOrigin = text.replaceAll(splitString1, '').replaceAll(splitString2, '');
    TextSpan textSpan = new TextSpan(text: key, style: new TextStyle(color: YcColors.colorPrimary));
    List<String> split = textOrigin.split(key);
    List<TextSpan> list = new List<TextSpan>();
    for (int i = 0; i < split.length; i++) {
      list.add(new TextSpan(text: split[i]));
      list.add(textSpan);
    }
    list.removeAt(list.length - 1);
    return new TextSpan(children: list);
  }
}
