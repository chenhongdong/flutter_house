import 'package:flutter/material.dart';
import 'package:flutter_rent_house/pages/home/tab_search/data_list.dart';
import 'package:flutter_rent_house/widgets/common_floating_action_button.dart';
import 'package:flutter_rent_house/widgets/room_list_item_widget.dart';

class RoomManage extends StatelessWidget {
  const RoomManage({super.key});

  static const List<Tab> tabs = [Tab(text: '已租'), Tab(text: '空置')];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        floatingActionButton: CommonFloatingActionButton('发布房源', (context) {
          Navigator.of(context).pushNamed('roomAdd');
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: const Text('房屋管理'),
          bottom: const TabBar(tabs: tabs),
          backgroundColor: Colors.green,
        ),
        body: TabBarView(children: [
          ListView(
            children:
                dataList.map((item) => RoomListItemWidget(data: item)).toList(),
          ),
          ListView(
            children:
                dataList.map((item) => RoomListItemWidget(data: item)).toList(),
          )
        ]),
      ),
    );
  }
}
