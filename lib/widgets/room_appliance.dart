import 'package:flutter/material.dart';
import 'package:flutter_rent_house/widgets/common_check_button.dart';

import '../config.dart';

class RoomApplianceItem {
  final String title;
  final int iconPoint;
  final bool isChecked;

  RoomApplianceItem(this.title, this.iconPoint, this.isChecked);
}

List<RoomApplianceItem> dataList = [
  RoomApplianceItem('衣柜', 0xe918, false),
  RoomApplianceItem('洗衣机', 0xe917, false),
  RoomApplianceItem('空调', 0xe90d, false),
  RoomApplianceItem('天然气', 0xe90f, false),
  RoomApplianceItem('冰箱', 0xe907, false),
  RoomApplianceItem('暖气', 0xe910, false),
  RoomApplianceItem('电视', 0xe908, false),
  RoomApplianceItem('热水器', 0xe912, false),
  RoomApplianceItem('宽带', 0xe90e, false),
  RoomApplianceItem('沙发', 0xe913, false)
];

class RoomAppliance extends StatefulWidget {
  final ValueChanged<List<RoomApplianceItem>> onChange;

  const RoomAppliance({super.key, required this.onChange});

  @override
  State<RoomAppliance> createState() => _RoomApplianceState();
}

class _RoomApplianceState extends State<RoomAppliance> {
  List<RoomApplianceItem> list = dataList;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        runSpacing: 30, // 换行后的上下间距
        children: list
            .map((item) => GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      list = list
                          .map((e) => e == item
                              ? RoomApplianceItem(
                                  item.title, item.iconPoint, !item.isChecked)
                              : e)
                          .toList();
                    });
                    if (widget.onChange != null) {
                      widget.onChange(list);
                    }
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                    child: Column(children: [
                      Icon(
                          IconData(item.iconPoint,
                              fontFamily: Config.commonIcon),
                          size: 40),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(item.title),
                      ),
                      CommonCheckButton(isChecked: item.isChecked)
                    ]),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class RoomApplianceList extends StatelessWidget {
  final List<String> list;

  const RoomApplianceList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    var showList = dataList.where((item) => list.contains(item.title)).toList();
    // 要是没有家具配置的数据就处理为空展示
    if (showList.isEmpty) {
      return Container(
        padding: const EdgeInsets.only(left: 10),
        child: const Text('暂无房屋配置信息！'),
      );
    }
    return Wrap(
      runSpacing: 30, // 换行后的上下间距
      children: showList
          .map((item) => SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: Column(children: [
                  Icon(IconData(item.iconPoint, fontFamily: Config.commonIcon),
                      size: 40),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(item.title),
                  )
                ]),
              ))
          .toList(),
    );
  }
}
