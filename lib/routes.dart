import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_rent_house/pages/home/index.dart';
import 'package:flutter_rent_house/pages/login.dart';
import 'package:flutter_rent_house/pages/not_found.dart';
import 'package:flutter_rent_house/pages/register.dart';
import 'package:flutter_rent_house/pages/room_add/index.dart';
import 'package:flutter_rent_house/pages/room_detail/index.dart';
import 'package:flutter_rent_house/pages/room_manage/index.dart';
import 'package:flutter_rent_house/pages/setting.dart';

class Routes {
  // 1. 定义路由名称
  static String home = '/';
  static String login = '/login';
  static String register = '/register';
  static String roomDetail = '/room/:roomId';
  static String setting = '/setting';
  static String roomManage = '/roomManager';
  static String roomAdd = '/roomAdd';

  // 2. 定义路由处理函数
  static final Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const HomePage();
  });
  static final Handler _loginHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const LoginPage();
  });
  static final Handler _registerHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const RegisterPage();
  });
  static final Handler _roomDetailHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return RoomDetailPage(roomId: params['roomId'][0]);
  });
  static final Handler _settingHandler =
      Handler(handlerFunc: (context, params) {
    return Setting();
  });
  static final Handler _roomManageHandler =
      Handler(handlerFunc: (context, params) {
    return RoomManage();
  });
  static final Handler _roomAddHandler =
      Handler(handlerFunc: (context, params) {
    return RoomAdd();
  });
  // 404路由
  static final Handler _notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const NotFoundPage();
  });

  // 3. 编写函数 configureRoutes 关联路由名称和处理函数
  static void configureRoutes(FluroRouter router) {
    router.define(home, handler: _homeHandler);
    router.define(login, handler: _loginHandler);
    router.define(register, handler: _registerHandler);
    router.define(roomDetail, handler: _roomDetailHandler);
    router.define(setting, handler: _settingHandler);
    router.define(roomManage, handler: _roomManageHandler);
    router.define(roomAdd, handler: _roomAddHandler);
    router.notFoundHandler = _notFoundHandler;
  }
}
