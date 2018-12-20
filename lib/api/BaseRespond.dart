

/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2018/9/12
 *     desc  : 返回数据
 *     revise:
 * </pre>
 */
class BaseRespond {

  /*
  返回数据结构如下所示
   {
  "data": ...,
  "errorCode": 0,
  "errorMsg": ""
   }
   */

  int errorCode;
  String errorMsg;
  String data;

}