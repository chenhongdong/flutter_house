import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rent_house/models/room_list_item_data.dart';
import 'package:flutter_rent_house/pages/home/tab_search/data_list.dart';
import 'package:flutter_rent_house/pages/home/tab_search/filter_bar/data.dart';
import 'package:flutter_rent_house/pages/home/tab_search/filter_bar/filter_drawer.dart';
import 'package:flutter_rent_house/pages/home/tab_search/filter_bar/index.dart';
import 'package:flutter_rent_house/utils/dio_http.dart';
import 'package:flutter_rent_house/utils/scoped_model_helper.dart';
import 'package:flutter_rent_house/widgets/room_list_item_widget.dart';
import 'package:flutter_rent_house/widgets/search_bar/index.dart';

class TabSearch extends StatefulWidget {
  const TabSearch({super.key});

  @override
  State<TabSearch> createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  // List<RoomListItemData> list = [];

  _onFilterBarChange(FilterBarResult data) async {
    var cityId = ScopedModelHelper.getAreaId(context);
    var area = Uri.encodeQueryComponent(data.areaId);
    var mode = Uri.encodeQueryComponent(data.rentTypeId);
    var price = Uri.encodeQueryComponent(data.priceId);
    var more = Uri.encodeQueryComponent(data.moreIds.join(','));
    String url = '/houses?cityId=' +
        '$cityId&area=$area&mode=$mode&price=$price&more=$more&start=1&end=20';

    var res = await DioHttp.of(context).get(url);
    var resMap = json.decode(res.toString());
    List list = resMap['body']['list'];

    List<RoomListItemData> resList =
        list.map((json) => RoomListItemData.fromJson(json)).toList();

    // 返回数据
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: FilterDrawer(),
      appBar: AppBar(
          elevation: 0,
          actions: [Container()], // 通过给一个空的actions button来隐藏抽屉的默认按钮
          title: SearchBarWidget(
            showLocaton: true,
            showMap: true,
            onSearch: () {
              Navigator.of(context).pushNamed('search');
            },
          ),
          backgroundColor: Colors.white),
      body: Column(children: [
        Container(
          child: FilterBar(
            onChange: (value) {},
            // onChange: _onFilterBarChange,
          ),
          height: 41.0,
        ),
        Expanded(
            child: ListView(
          children:
              dataList.map((item) => RoomListItemWidget(data: item)).toList(),
        ))
      ]),
    );
  }
}
