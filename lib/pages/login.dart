import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rent_house/scoped_model/auth.dart';
import 'package:flutter_rent_house/utils/common_toast.dart';
import 'package:flutter_rent_house/utils/dio_http.dart';
import 'package:flutter_rent_house/utils/scoped_model_helper.dart';
import 'package:flutter_rent_house/utils/store.dart';
import 'package:flutter_rent_house/utils/string_is_empty.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  _loginHandler() async {
    var username = usernameController.text;
    var password = passwordController.text;

    if (stringIsEmpty(username) || stringIsEmpty(password)) {
      CommonToast.toast('用户名或密码不能为空！');
      return;
    }

    const path = '/login';
    var params = {'username': username, 'password': password};
    var res = await DioHttp.of(context).post(path, params);
    var resMap = json.decode(res.data.toString());
    CommonToast.toast(resMap);
    int status = resMap['status'];
    String description = resMap['description'] ?? '内部错误';
    CommonToast.toast(description);

    if (status.toString().startsWith('2')) {
      String token = resMap['body']['token'];
      // 将token写入本地缓存
      Store store = await Store.getInstance();
      await store.setString(StoreKeys.token, token);

      ScopedModelHelper.getModel<AuthModel>(context).login(token, context);

      Timer(Duration(seconds: 1), () {
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(30),
        child: ListView(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: '用户名', hintText: '请输入用户名'),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            TextField(
              obscureText: !showPassword,
              controller: passwordController, // 不显示内容
              decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '请输入密码',
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: Icon(showPassword
                          ? Icons.visibility_off
                          : Icons.visibility))),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
                onPressed: () {
                  _loginHandler();
                },
                child: const Text('登录', style: TextStyle(color: Colors.white))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('还没有账号'),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'register');
                    },
                    child: const Text('去注册',
                        style: TextStyle(color: Colors.green)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
