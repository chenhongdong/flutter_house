import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rent_house/models/user_info.dart';
import 'package:flutter_rent_house/utils/dio_http.dart';
import 'package:flutter_rent_house/utils/store.dart';
import 'package:flutter_rent_house/utils/string_is_empty.dart';
import 'package:scoped_model/scoped_model.dart';

class AuthModel extends Model {
  String _token = '';
  String get token => _token;
  late UserInfo _userInfo;
  UserInfo get userInfo => _userInfo;

  bool get isLogin => _token is String && _token != '';

  void initApp(BuildContext context) async {
    Store store = await Store.getInstance();
    String token = await store.getString(StoreKeys.token);
    if (!stringIsEmpty(token)) {
      login(token, context);
    }
  }

  void login(String token, BuildContext context) {
    _token = token;
    // 通知所以依赖token的组件都更新一下
    notifyListeners();
    _getUserInfo(context);
  }

  void logout() {
    _token = '';
    // _userInfo = UserInfo('', '', '', '', 0);
    _userInfo = {} as UserInfo;
    notifyListeners();
  }

  _getUserInfo(BuildContext context) async {
    const url = '/user';
    var res = await DioHttp.of(context).get(url, null, _token);
    var resMap = json.decode(res.toString());
    var data = resMap['body'];
    var userInfo = UserInfo.fromJson(data);
    _userInfo = userInfo;
    notifyListeners();
  }
}
