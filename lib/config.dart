import 'package:flutter_rent_house/models/general_type.dart';

class Config {
  static const commonIcon = 'commonIcon';
  static const baseUrl = 'http://192.168.137.1:8080';
  // https://www.fastmock.site/mock/432a14676095fee4c04836707d74972f/api

  static List<GeneralType> availableCitys = [
    GeneralType('北京', 'AREA|88cff55c-aaa4-e2e0'),
    GeneralType('上海', 'AREA|dbf46d32-7e76-1196'),
    GeneralType('深圳', 'AREA|a6649a11-be98-b150'),
    GeneralType('广州', 'AREA|e4940177-c04c-383d')
  ];
}
