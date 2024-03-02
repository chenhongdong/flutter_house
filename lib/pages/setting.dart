import 'package:flutter/material.dart';
import 'package:flutter_rent_house/scoped_model/auth.dart';
import 'package:flutter_rent_house/utils/common_toast.dart';
import 'package:flutter_rent_house/utils/scoped_model_helper.dart';
import 'package:scoped_model/scoped_model.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('设置')),
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                ScopedModelHelper.getModel<AuthModel>(context).logout();
                CommonToast.toast('退出退出~！');
              },
              child: Text('退出登录'))
        ],
      ),
    );
  }
}
