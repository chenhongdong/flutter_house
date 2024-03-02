import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rent_house/models/general_type.dart';
import 'package:flutter_rent_house/pages/home/tab_search/filter_bar/data.dart';
import 'package:flutter_rent_house/pages/home/tab_search/filter_bar/item.dart';
import 'package:flutter_rent_house/scoped_model/room_filter.dart';
import 'package:flutter_rent_house/utils/common_picker/index.dart';
import 'package:flutter_rent_house/utils/dio_http.dart';
import 'package:flutter_rent_house/utils/scoped_model_helper.dart';
import 'package:scoped_model/scoped_model.dart';

String? lastCityId;

class FilterBar extends StatefulWidget {
  final ValueChanged<FilterBarResult> onChange;

  const FilterBar({super.key, required this.onChange});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  // List<GeneralType> areaList = [];
  // List<GeneralType> priceList = [];
  // List<GeneralType> rentTypeList = [];
  // List<GeneralType> roomTypeList = [];
  // List<GeneralType> orientedList = [];
  // List<GeneralType> floorList = [];

  bool areaActive = false;
  bool rentTypeActive = false;
  bool priceActive = false;
  bool filterActive = false;

  String areaId = '';
  String rentTypeId = '';
  String priceId = '';
  List<String> moreIds = [];

  _getData() async {
    // var cityId = ScopedModelHelper.getAreaId(context);
    // lastCityId = cityId;
    // final url = '/houses/condition?id=$cityId';

    // var res = await DioHttp.of(context).get(url);
    // var data = json.decode(res.toString())['body'];

    // // 组件卸载了就不再调setState
    // if (!this.mounted) {
    //   return;
    // }

    // List<GeneralType> areaList = List<GeneralType>.from(
    //         data['area']['children'].map((item) => GeneralType.fromJson(item)))
    //     .toList();
    // List<GeneralType> priceList = List<GeneralType>.from(
    //     data['price'].map((item) => GeneralType.fromJson(item))).toList();
    // List<GeneralType> rentTypeList = List<GeneralType>.from(
    //     data['rentType'].map((item) => GeneralType.fromJson(item))).toList();
    // List<GeneralType> roomTypeList = List<GeneralType>.from(
    //     data['roomType'].map((item) => GeneralType.fromJson(item))).toList();
    // List<GeneralType> orientedList = List<GeneralType>.from(
    //     data['oriented'].map((item) => GeneralType.fromJson(item))).toList();
    // List<GeneralType> floorList = List<GeneralType>.from(
    //     data['floor'].map((item) => GeneralType.fromJson(item))).toList();

    // setState(() {
    //   this.areaList = areaList;
    //   this.priceList = priceList;
    //   this.rentTypeList = rentTypeList;
    //   this.roomTypeList = roomTypeList;
    //   this.orientedList = orientedList;
    //   this.floorList = floorList;
    // });

    Map<String, List<GeneralType>> dataList = Map<String, List<GeneralType>>();
    dataList['roomTypeList'] = roomTypeList;
    dataList['orientedList'] = orientedList;
    dataList['floorList'] = floorList;

    ScopedModelHelper.getModel<FilterBarModel>(context).dataList = dataList;
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 1), _getData);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _onChanged();
    // lastCityId不等于当前的cityId时就重新获取数据切换为新的城市
    if (lastCityId != null &&
        ScopedModelHelper.getAreaId(context) != lastCityId) {
      _getData();
    }
    super.didChangeDependencies();
  }

  _onAreaChange(context) {
    setState(() {
      areaActive = true;
    });
    var result = CommonPicker.showPicker(
        context: context,
        options: areaList.map((item) => item.name).toList(),
        value: 0);
    result.then((index) {
      if (index == null) return;
      setState(() {
        areaId = areaList[index].id;
      });
      _onChanged();
    }).whenComplete(() {
      // 类似JS中Promise里的finally
      setState(() {
        areaActive = false;
      });
    });
  }

  _onRentTypeChange(context) {
    setState(() {
      rentTypeActive = true;
    });
    var result = CommonPicker.showPicker(
        context: context,
        options: rentTypeList.map((item) => item.name).toList(),
        value: 0);
    result.then((index) {
      if (index == null) return;
      setState(() {
        rentTypeId = rentTypeList[index].id;
      });
      _onChanged();
    }).whenComplete(() {
      setState(() {
        rentTypeActive = false;
      });
    });
  }

  _onPriceChange(context) {
    setState(() {
      priceActive = true;
    });
    var result = CommonPicker.showPicker(
        context: context,
        options: priceList.map((item) => item.name).toList(),
        value: 0);
    result.then((index) {
      if (index == null) return;
      setState(() {
        priceId = priceList[index].id;
      });
      _onChanged();
    }).whenComplete(() {
      setState(() {
        priceActive = false;
      });
    });
  }

  _onFilterChange(context) {
    Scaffold.of(context).openEndDrawer();
  }

  _onChanged() {
    var selectedList =
        ScopedModelHelper.getModel<FilterBarModel>(context).selectedList;
    if (widget.onChange != null) {
      widget.onChange(FilterBarResult(
          areaId: areaId,
          priceId: priceId,
          rentTypeId: rentTypeId,
          moreIds: selectedList.toList()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Item(title: '区域', isActive: areaActive, onTap: _onAreaChange),
        Item(title: '方式', isActive: rentTypeActive, onTap: _onRentTypeChange),
        Item(title: '租金', isActive: priceActive, onTap: _onPriceChange),
        Item(title: '筛选', isActive: filterActive, onTap: _onFilterChange)
      ]),
    );
  }
}
