// 添加 material 依赖
import 'package:flutter/material.dart';
import 'package:flutter_rent_house/routes.dart';

// 编写无状态组件
class PageContent extends StatelessWidget {
  final String name;
  const PageContent({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('当前页面：$name'),
      ),
      body: ListView(children: [
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.home);
            },
            child: Text(Routes.home)),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.login);
            },
            child: Text(Routes.login)),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/room/123');
            },
            child: const Text('房屋详情页：id: 123')),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/abc');
            },
            child: const Text('不存在的页面'))
      ]),
    );
  }
}
