import 'package:flutter/material.dart';
import 'package:flutter_rent_house/pages/home/tab_index/index.dart';
import 'package:flutter_rent_house/pages/home/tab_info/index.dart';
import 'package:flutter_rent_house/pages/home/tab_profile/index.dart';
import 'package:flutter_rent_house/pages/home/tab_search/index.dart';

// 1. 准备4个 tab 内容区
List<Widget> tabViewList = [
  const TabIndex(),
  const TabSearch(),
  const TabInfo(),
  const TabProfile()
];

// 2. 准备4个 BottomNavigationBarItem
List<BottomNavigationBarItem> barItemList = [
  const BottomNavigationBarItem(label: '首页', icon: Icon(Icons.home)),
  const BottomNavigationBarItem(label: '找房', icon: Icon(Icons.search)),
  const BottomNavigationBarItem(label: '资讯', icon: Icon(Icons.article)),
  const BottomNavigationBarItem(label: '我的', icon: Icon(Icons.account_circle))
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabViewList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: barItemList,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
