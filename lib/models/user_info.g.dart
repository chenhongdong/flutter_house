// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      json['avatar'] as String,
      json['gender'] as String,
      json['nickname'] as String,
      json['tel'] as String,
      json['id'] as int,
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'avatar': instance.avatar,
      'gender': instance.gender,
      'nickname': instance.nickname,
      'tel': instance.phone,
      'id': instance.id,
    };
