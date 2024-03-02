import 'package:flutter/material.dart';
import 'package:flutter_rent_house/config.dart';
import 'package:flutter_rent_house/scoped_model/city.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedModelHelper {
  static T getModel<T extends Model>(BuildContext context) {
    return ScopedModel.of<T>(context, rebuildOnChange: true);
  }

  static String getAreaId(context) {
    return ScopedModelHelper.getModel<CityModel>(context).city?.id ??
        Config.availableCitys.first.id; // 如果city.id为空就取  4个可用城市里的第一个城市id
  }
}
