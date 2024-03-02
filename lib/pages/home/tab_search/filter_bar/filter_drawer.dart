import 'package:flutter/material.dart';
import 'package:flutter_rent_house/models/general_type.dart';
import 'package:flutter_rent_house/scoped_model/room_filter.dart';
import 'package:flutter_rent_house/utils/scoped_model_helper.dart';
import 'package:flutter_rent_house/widgets/common_title.dart';

import 'data.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var dataList = ScopedModelHelper.getModel<FilterBarModel>(context).dataList;
    roomTypeList = dataList['roomTypeList']!;
    orientedList = dataList['orientedList']!;
    floorList = dataList['floorList']!;
    var selectedIds = ScopedModelHelper.getModel<FilterBarModel>(context)
        .selectedList
        .toList();

    _onChange(String id) {
      ScopedModelHelper.getModel<FilterBarModel>(context)
          .selectedListToggleItem(id);
    }

    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            const CommonTitle('户型'),
            FilterDrawerItem(
                list: roomTypeList,
                selectedIds: selectedIds,
                onChange: _onChange),
            const CommonTitle('朝向'),
            FilterDrawerItem(
                list: orientedList,
                selectedIds: selectedIds,
                onChange: _onChange),
            const CommonTitle('楼层'),
            FilterDrawerItem(
                list: floorList, selectedIds: selectedIds, onChange: _onChange),
          ],
        ),
      ),
    );
  }
}

class FilterDrawerItem extends StatelessWidget {
  final List<GeneralType> list;
  final List<String> selectedIds;
  final ValueChanged<String> onChange;

  const FilterDrawerItem(
      {super.key,
      required this.list,
      required this.selectedIds,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: list.map((item) {
          var isActive = selectedIds.contains(item.id);
          return GestureDetector(
            onTap: () {
              if (onChange != null) {
                onChange(item.id);
              }
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                  color: isActive ? Colors.green : Colors.white,
                  border: Border.all(color: Colors.green)),
              child: Center(
                  child: Text(item.name,
                      style: TextStyle(
                          color: isActive ? Colors.white : Colors.green))),
            ),
          );
        }).toList(),
      ),
    );
  }
}
