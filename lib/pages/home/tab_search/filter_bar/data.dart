// 结果数据类型
import 'package:flutter_rent_house/models/general_type.dart';

class FilterBarResult {
  final String areaId;
  final String priceId;
  final String rentTypeId;
  final List<String> moreIds;

  FilterBarResult(
      {required this.areaId,
      required this.priceId,
      required this.rentTypeId,
      required this.moreIds});
}

List<GeneralType> areaList = [
  GeneralType('西城区', '11'),
  GeneralType('东城区', '22'),
  GeneralType('海淀区', '33'),
  GeneralType('朝阳区', '44'),
  GeneralType('通州区', '55'),
  GeneralType('昌平区', '66'),
  GeneralType('丰台区', '77'),
  GeneralType('石景山区', '88')
];
List<GeneralType> priceList = [
  GeneralType('3500', '1'),
  GeneralType('4000', '2'),
  GeneralType('5000', '12')
];
List<GeneralType> rentTypeList = [
  GeneralType('整租', '3'),
  GeneralType('合租', '4'),
];
List<GeneralType> roomTypeList = [
  GeneralType('房屋类型1', '5'),
  GeneralType('房屋类型2', '6'),
];
List<GeneralType> orientedList = [
  GeneralType('东西', '7'),
  GeneralType('南北', '8'),
];
List<GeneralType> floorList = [
  GeneralType('低楼层', '9'),
  GeneralType('高楼层', '10')
];
