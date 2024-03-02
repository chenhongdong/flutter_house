import 'dart:convert';

import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rent_house/config.dart';
import 'package:flutter_rent_house/models/general_type.dart';
import 'package:flutter_rent_house/scoped_model/city.dart';
import 'package:flutter_rent_house/utils/common_toast.dart';
import 'package:flutter_rent_house/utils/scoped_model_helper.dart';
import 'package:flutter_rent_house/utils/store.dart';
import 'package:flutter_rent_house/widgets/common_image.dart';

class SearchBarWidget extends StatefulWidget {
  final bool showLocaton; // 展示位置按钮
  final void Function()? goBackCallBack; // 回退按钮函数
  final String inputValue; // 搜索框输入值
  final String defaultInputValue; // 搜索框默认值
  final void Function()? onCancel; // 取消按钮
  final bool showMap; // 展示地图按钮
  final void Function()? onSearch; // 用户点击搜索框触发
  final ValueChanged<String>? onSearchSubmit;

  const SearchBarWidget(
      {super.key,
      this.showLocaton = false,
      this.goBackCallBack,
      this.inputValue = '',
      this.defaultInputValue = '请输入搜索词',
      this.onCancel,
      this.showMap = false,
      this.onSearch,
      this.onSearchSubmit});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  String _searchWord = '';
  TextEditingController? _controller;
  FocusNode? _focus;

  _onClean() {
    setState(() {
      _searchWord = '';
    });
    _controller!.clear();
  }

  @override
  void initState() {
    _controller = TextEditingController(text: widget.inputValue);
    _focus = FocusNode();
    super.initState();
  }

  _changeLocation() async {
    var result = await CityPickers.showCitiesSelector(
        context: context,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)));

    String? cityName = result?.cityName;
    if (cityName == null) return;

    var city = Config.availableCitys
        .firstWhere((city) => cityName.startsWith(city.name), orElse: () {
      CommonToast.toast('该城市暂未开通！');
      return GeneralType('', '');
    });
    if (city == null) return;

    // 保存城市
    _saveCity(city);
  }

  _saveCity(GeneralType city) async {
    if (city == null) return;
    // 存到全局作用域下
    ScopedModelHelper.getModel<CityModel>(context).city;
    var store = await Store.getInstance();
    // 存到本地缓存里
    var cityString = json.encode(city.toJson());
    store.setString(StoreKeys.city, cityString);
  }

  _getCity() async {
    var store = await Store.getInstance();
    var cityString = await store.getString(StoreKeys.city);
    if (cityString == null) return;
    var city = GeneralType.fromJson(json.decode(cityString));
    ScopedModelHelper.getModel<CityModel>(context).city = city;
  }

  @override
  Widget build(BuildContext context) {
    var city = ScopedModelHelper.getModel<CityModel>(context).city;
    if (city == null) {
      city = Config.availableCitys.first;
      _getCity();
    }

    return Container(
      child: Row(
        children: [
          // 有状态组件如果拿到参数需要使用widget获取
          if (widget.showLocaton)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  _changeLocation();
                },
                child: Row(
                  children: [
                    Icon(Icons.room, color: Colors.green, size: 16),
                    Text(
                      city.name,
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
          if (widget.goBackCallBack != null)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: widget.goBackCallBack,
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.black87,
                ),
              ),
            ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(17)),
            margin: const EdgeInsets.only(right: 10),
            height: 34,
            child: TextField(
              onTap: () {
                if (widget.onSearchSubmit == null) {
                  _focus!.unfocus();
                }
                widget.onSearch!();
              },
              onSubmitted: widget.onSearchSubmit,
              controller: _controller,
              focusNode: _focus,
              textInputAction: TextInputAction.search, // 键盘的确认按钮变为"搜索"
              onChanged: (value) {
                setState(() {
                  _searchWord = value;
                });
              },
              decoration: InputDecoration(
                  labelStyle: const TextStyle(fontSize: 14),
                  contentPadding: const EdgeInsets.only(left: -10),
                  // 前置图标
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.search,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),
                  // 后置图标
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _onClean();
                    },
                    child: Icon(
                      Icons.clear,
                      size: 18,
                      color: _searchWord == '' ? Colors.grey[200] : Colors.grey,
                    ),
                  ),
                  hintText: widget.defaultInputValue,
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  border: InputBorder.none),
            ),
          )),
          if (widget.onCancel != null)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: widget.onCancel,
                child: const Text(
                  '取消',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            ),
          if (widget.showMap)
            const CommonImage(src: 'static/icons/widget_search_bar_map.png')
        ],
      ),
    );
  }
}
