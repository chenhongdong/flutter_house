import 'package:flutter/material.dart';
import 'package:flutter_rent_house/scoped_model/auth.dart';
import 'package:flutter_rent_house/utils/scoped_model_helper.dart';

class FunctionButtonItem {
  final String imageUrl;
  final String title;
  final void Function(dynamic)? onTap;

  FunctionButtonItem(this.imageUrl, this.title, this.onTap);
}

final List<FunctionButtonItem> list = [
  FunctionButtonItem('static/images/home_profile_record.png', '看房记录', null),
  FunctionButtonItem('static/images/home_profile_order.png', '我的订单', null),
  FunctionButtonItem('static/images/home_profile_favor.png', '我的收藏', null),
  FunctionButtonItem('static/images/home_profile_id.png', '身份认证', null),
  FunctionButtonItem('static/images/home_profile_message.png', '联系我们', null),
  FunctionButtonItem('static/images/home_profile_contract.png', '电子合同', null),
  FunctionButtonItem('static/images/home_profile_wallet.png', '钱包', null),
  FunctionButtonItem('static/images/home_profile_house.png', '房屋管理', (context) {
    bool isLogin = ScopedModelHelper.getModel<AuthModel>(context).isLogin;
    if (isLogin) {
      Navigator.of(context).pushNamed('roomManager');
      return;
    }
    Navigator.of(context).pushNamed('login');
  }),
];
