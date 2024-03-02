import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rent_house/utils/common_toast.dart';
import 'package:flutter_rent_house/utils/dio_http.dart';
import 'package:flutter_rent_house/utils/string_is_empty.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool showPassword = false;
  bool showAgainPassword = false;
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var repeatPasswordController = TextEditingController();

  _registerHandler() async {
    var username = usernameController.text;
    var password = passwordController.text;
    var repeatPassword = repeatPasswordController.text;
    // 校验密码和确认密码一致性
    if (password != repeatPassword) {
      CommonToast.toast('两次输入的密码不一致！');
      return;
    }
    if (stringIsEmpty(username) || stringIsEmpty(password)) {
      CommonToast.toast('用户名或密码不能为空！');
      return;
    }

    const url = 'user/registered';
    var params = {"username": username, "password": password};
    var res = await DioHttp.of(context).post(url, params);
    var resStr = json.decode(res.toString());

    int status = resStr['status'];
    String description = resStr['description'] ?? '内部错误';
    CommonToast.toast(description);
    if (status.toString().startsWith('2')) {
      Navigator.of(context).pushReplacementNamed('login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('注册'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(30),
        child: ListView(
          children: [
            TextField(
              controller: usernameController,
              decoration:
                  const InputDecoration(labelText: '用户名', hintText: '请输入用户名'),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            TextField(
              obscureText: !showPassword, // 不显示内容
              controller: passwordController,
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
            TextField(
              obscureText: !showAgainPassword, // 不显示内容
              controller: repeatPasswordController,
              decoration: InputDecoration(
                  labelText: '确认密码',
                  hintText: '请再次输入密码',
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showAgainPassword = !showAgainPassword;
                        });
                      },
                      icon: Icon(showAgainPassword
                          ? Icons.visibility_off
                          : Icons.visibility))),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
                onPressed: () {
                  _registerHandler();
                },
                child: const Text('注册', style: TextStyle(color: Colors.white))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('已有账号'),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'login');
                    },
                    child: const Text('去登录',
                        style: TextStyle(color: Colors.green)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
