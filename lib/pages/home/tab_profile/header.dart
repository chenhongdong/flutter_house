import 'package:flutter/material.dart';
import 'package:flutter_rent_house/scoped_model/auth.dart';
import 'package:flutter_rent_house/utils/scoped_model_helper.dart';

var loginRegisterStyle = const TextStyle(color: Colors.white, fontSize: 20);

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  Widget _notLoginBuilder(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.green),
      height: 95,
      child: Row(
        children: [
          Container(
            width: 65,
            height: 65,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://xsk-hhw.oss-cn-beijing.aliyuncs.com/mk-xsk-haohaowan/org-1000/a/png/2024/0202/731a7a5238526eaa09dba0d0b7f848a5cf04c27442b5f297aa25e190539da5bf.png'),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  GestureDetector(
                    child: Text('登录', style: loginRegisterStyle),
                    onTap: () {
                      Navigator.of(context).pushNamed('login');
                    },
                  ),
                  Text('/', style: loginRegisterStyle),
                  GestureDetector(
                    child: Text('注册', style: loginRegisterStyle),
                    onTap: () {
                      Navigator.of(context).pushNamed('register');
                    },
                  )
                ],
              ),
              const Text(
                '登录后可体验更多',
                style: TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _loginBuilder(BuildContext context) {
    var userInfo = ScopedModelHelper.getModel<AuthModel>(context).userInfo;
    String userName = userInfo?.nickname ?? '小白的一天';
    String userImg = userInfo?.avatar ??
        'https://t14.baidu.com/it/u=3530242531,2445069725&fm=58';

    return Container(
      decoration: const BoxDecoration(color: Colors.green),
      height: 95,
      child: Row(
        children: [
          Container(
            width: 65,
            height: 65,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: CircleAvatar(
              backgroundImage: NetworkImage(userImg),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(userName, style: loginRegisterStyle),
              const Text(
                '查看编辑个人资料',
                style: TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var isLogin = ScopedModelHelper.getModel<AuthModel>(context).isLogin;
    return isLogin ? _loginBuilder(context) : _notLoginBuilder(context);
  }
}
