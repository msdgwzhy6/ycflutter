

import 'package:flutter/material.dart';
import 'package:ycflutter/api/AndroidApi.dart';
import 'package:ycflutter/api/HttpUtils.dart';
import 'package:ycflutter/res/YcColors.dart';
import 'package:ycflutter/utils/ToastUtils.dart';
import 'package:ycflutter/utils/UserUtils.dart';

/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2018/10/28
 *     desc  : 新闻item条目控件
 *     revise:
 * </pre>
 */
class LoginPage  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<LoginPage> {

  TextEditingController username = new TextEditingController(text: 'yangchong');
  TextEditingController pwd = new TextEditingController(text: '123456');
  GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    Row person = initRowPerson();
    TextField name = initTextName();
    TextField password = initTextPwd();
    Row loginAndRegister = initLoginAndRegister();
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text('登录'),
      ),
      body: new Padding(
        padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 0.0),
        child: new ListView(
          children: <Widget>[
            person,
            new Padding(
              padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 0.0),
            ),
            name,
            password,
            new Padding(
              padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 0.0),
            ),
            loginAndRegister,
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  //初始化登陆头像
  Row initRowPerson() {
    Row person = new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(
          Icons.account_circle,
          color: YcColors.colorIndigo,
          size: 100.0,
        ),
      ],
    );
    return person;
  }

  TextField initTextName() {
    TextField name = new TextField(
      autofocus: true,
      cursorColor: YcColors.colorRed,
      decoration: new InputDecoration(
        labelText: "用户名",
        fillColor: YcColors.colorBlack87,
      ),
      controller: username,
    );
    return name;
  }

  TextField initTextPwd() {
    TextField password = new TextField(
      cursorColor: YcColors.colorRed,
      decoration: InputDecoration(
          labelText: "密码",
          fillColor: YcColors.colorBlack87,
      ),
      obscureText: true,
      controller: pwd,
    );
    return password;
  }

  Row initLoginAndRegister() {
    Row loginAndRegister = new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new RaisedButton(
          child: new Text(
            "开始登录",
            style: new TextStyle(
                color: Colors.white,
                fontSize: 16
            ),
          ),
          color: Theme.of(context).accentColor,
          disabledColor: YcColors.colorPrimary,
          textColor: Colors.white,
          onPressed: () {
            login();
          },
        ),
        new RaisedButton(
          child: new Text(
            "开始注册",
            style: new TextStyle(
              color: Colors.white,
              fontSize: 16
            ),
          ),
          color: YcColors.colorPrimary,
          disabledColor: YcColors.colorPrimary,
          textColor: Colors.white,
          onPressed: () {
            register();
          },
        ),
      ],
    );
    return loginAndRegister;
  }

  //登陆
  void login() {
    String name = username.text;
    String password = pwd.text;
    if (name.length == 0) {
      ToastUtils.showToast('请先输入姓名');
      return;
    }
    if (password.length == 0) {
      ToastUtils.showToast('请先输入密码');
      return;
    }
    Map<String, String> map = new Map();
    map['username'] = name;
    map['password'] = password;

    HttpUtils.post(
        AndroidApi.LOGIN, (data) async {
          UserUtils.saveLoginInfo(name).then((r) {
            Navigator.of(context).pop();
          });
        },
        params: map,
        errorCallback: (msg) {
          ToastUtils.showToast(msg);
        });
  }

  //注册
  void register() {
    String name = username.text;
    String password = pwd.text;
    if (name.length == 0) {
      ToastUtils.showToast('请先输入姓名');
      return;
    }
    if (password.length == 0) {
      ToastUtils.showToast('请先输入密码');
      return;
    }
    Map<String, String> map = new Map();
    map['username'] = name;
    map['password'] = password;
    map['repassword'] = password;

    HttpUtils.post(AndroidApi.REGISTER, (data) async {
      UserUtils.saveLoginInfo(name).then((r) {
          Navigator.of(context).pop();
        });
      },
      params: map,
      errorCallback: (msg) {
        ToastUtils.showToast(msg);
      });
  }
}