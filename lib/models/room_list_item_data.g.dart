// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_list_item_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomListItemData _$RoomListItemDataFromJson(Map<String, dynamic> json) =>
    RoomListItemData(
      id: json['houseCode'] as String,
      title: json['title'] as String,
      subTitle: json['desc'] as String,
      imageUrl: json['houseImg'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      price: json['price'] as int,
    );

Map<String, dynamic> _$RoomListItemDataToJson(RoomListItemData instance) =>
    <String, dynamic>{
      'houseCode': instance.id,
      'title': instance.title,
      'desc': instance.subTitle,
      'houseImg': instance.imageUrl,
      'tags': instance.tags,
      'price': instance.price,
    };
