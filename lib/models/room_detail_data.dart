import 'package:json_annotation/json_annotation.dart';

part 'room_detail_data.g.dart';

@JsonSerializable()
class RoomDetailData {
  @JsonKey(name: 'houseCode')
  final String? id;
  final String? title;
  final String? community;

  @JsonKey(name: 'description')
  final String? subTitle;
  final int? size;
  final String? floor;
  final int? price;
  final String? roomType;

  @JsonKey(name: 'houseImg')
  final List<String> houseImgs;
  final List<String> oriented;
  final List<String> tags;

  @JsonKey(name: 'supporting')
  final List<String> appliances;

  RoomDetailData(
      {this.id,
      this.title,
      this.community,
      this.subTitle,
      this.size,
      this.floor,
      this.price,
      this.roomType,
      required this.houseImgs,
      required this.oriented,
      required this.tags,
      required this.appliances});

  factory RoomDetailData.fromJson(Map<String, dynamic> json) =>
      _$RoomDetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$RoomDetailDataToJson(this);
}

var defaultData = RoomDetailData(
    id: '1111',
    title: '整租 中山路 历史最低价',
    community: '中山花园',
    subTitle:
        '近地铁，附近有商场！广州再出新政：限购区域面积120平方米以上住房不再限购。在限购区域范围内，购买建筑面积120平方米以上(不含120平方米)住房，不纳入限购范围。春节期间，身穿汉服或少数民族服饰可免费乘坐地铁行走姑苏。澎湃新闻2月4日从苏州轨道交通集团获悉，9日（除夕）至17日（初八），穿全套传统汉服或中国少数民族服饰的乘客可免票进站乘车。乘客进站后可向工作人员提出免费乘车需求，工作人员确认后即开放绿色通道，无需刷卡、扫码。',
    size: 100,
    floor: '高楼层',
    price: 3000,
    oriented: ['南'],
    roomType: '三室',
    appliances: ['衣柜', '洗衣机'],
    tags: ["近地铁", "集中供暖", "新上", "随时看房"],
    houseImgs: [
      'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tdgve1j30ku0bsn75.jpg',
      'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2whp87sj30ku0bstec.jpg',
      'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tl1v3bj30ku0bs77z.jpg',
    ]);
