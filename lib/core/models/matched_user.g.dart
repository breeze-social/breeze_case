// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matched_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchedUser _$MatchedUserFromJson(Map<String, dynamic> json) => MatchedUser(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$MatchedUserToJson(MatchedUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'photo': instance.photo,
    };
