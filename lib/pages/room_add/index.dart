import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rent_house/widgets/common_floating_action_button.dart';
import 'package:flutter_rent_house/widgets/common_form_item.dart';
import 'package:flutter_rent_house/widgets/common_image_picker.dart';
import 'package:flutter_rent_house/widgets/common_radio_form_item.dart';
import 'package:flutter_rent_house/widgets/common_select_form_item.dart';
import 'package:flutter_rent_house/widgets/common_title.dart';
import 'package:flutter_rent_house/widgets/room_appliance.dart';

class RoomAdd extends StatefulWidget {
  const RoomAdd({super.key});

  @override
  State<RoomAdd> createState() => _RoomAddState();
}

class _RoomAddState extends State<RoomAdd> {
  int rentType = 0; // 租赁方式
  int decorationType = 0; // 装修类型

  int roomType = 0; // 户型
  int floor = 0; // 楼层
  int oriented = 0; // 朝向

  var titleController = TextEditingController();
  var descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('房源发布'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          const CommonTitle('房源信息'),
          CommonFormItem(
              label: '小区',
              contentBuilder: (context) {
                return Container(
                  child: GestureDetector(
                    behavior:
                        HitTestBehavior.translucent, // 这个属性会让用户在点击空白区域时也生效
                    onTap: () {
                      Navigator.of(context).pushNamed('search');
                    },
                    child: const SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '请选择小区',
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(Icons.keyboard_arrow_right)
                        ],
                      ),
                    ),
                  ),
                );
              },
              controller: TextEditingController()),
          CommonFormItem(
              label: '租金',
              suffixText: '元/月',
              hintText: '请输入租金',
              controller: TextEditingController()),
          CommonFormItem(
              label: '面积',
              suffixText: '平方米',
              hintText: '请输入房屋面积',
              controller: TextEditingController()),
          CommonRadioFormItem(
            label: '租赁方式',
            options: const ['合租', '整租'],
            value: rentType,
            onChange: (index) {
              setState(() {
                rentType = index as int;
              });
            },
          ),
          CommonSelectFormItem(
              label: '户型',
              value: roomType,
              options: const ['一室', '二室', '三室', '四室'],
              onChange: (val) {
                setState(() {
                  roomType = val;
                });
              }),
          CommonSelectFormItem(
              label: '楼层',
              value: floor,
              options: const ['高楼层', '中楼层', '低楼层'],
              onChange: (val) {
                setState(() {
                  floor = val;
                });
              }),
          CommonSelectFormItem(
              label: '朝向',
              value: oriented,
              options: const ['东', '南', '西', '北'],
              onChange: (val) {
                setState(() {
                  oriented = val;
                });
              }),
          CommonRadioFormItem(
            label: '装修',
            options: const ['精装', '简装'],
            value: decorationType,
            onChange: (index) {
              setState(() {
                decorationType = index as int;
              });
            },
          ),
          const CommonTitle('房屋图像'),
          CommonImagePicker(
            onChange: (List<File> files) {},
          ),
          const CommonTitle('房屋标题'),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: '请输入标题（例如：整租，小区名 两室 2000元）',
                  border: InputBorder.none,
                ),
              )),
          const CommonTitle('房屋配置'),
          RoomAppliance(onChange: (list) {}),
          const CommonTitle('房屋描述'),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(bottom: 100),
              child: TextField(
                controller: descController,
                maxLines: 10,
                decoration: const InputDecoration(
                  hintText: '请输入房屋描述信息',
                  border: InputBorder.none,
                ),
              ))
        ],
      ),
      floatingActionButton: CommonFloatingActionButton('提交', (context) {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
