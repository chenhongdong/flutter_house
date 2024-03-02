// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_detail_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomDetailData _$RoomDetailDataFromJson(Map<String, dynamic> json) =>
    RoomDetailData(
      id: json['houseCode'] as String?,
      title: json['title'] as String?,
      community: json['community'] as String?,
      subTitle: json['description'] as String?,
      size: json['size'] as int?,
      floor: json['floor'] as String?,
      price: json['price'] as int?,
      roomType: json['roomType'] as String?,
      houseImgs:
          (json['houseImg'] as List<dynamic>).map((e) => e as String).toList(),
      oriented:
          (json['oriented'] as List<dynamic>).map((e) => e as String).toList(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      appliances: (json['supporting'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RoomDetailDataToJson(RoomDetailData instance) =>
    <String, dynamic>{
      'houseCode': instance.id,
      'title': instance.title,
      'community': instance.community,
      'description': instance.subTitle,
      'size': instance.size,
      'floor': instance.floor,
      'price': instance.price,
      'roomType': instance.roomType,
      'houseImg': instance.houseImgs,
      'oriented': instance.oriented,
      'tags': instance.tags,
      'supporting': instance.appliances,
    };
