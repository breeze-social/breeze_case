// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Match _$MatchFromJson(Map<String, dynamic> json) => Match(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      matchedUsers: (json['matchedUsers'] as List<dynamic>)
          .map((e) => MatchedUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: json['city'] as String,
      dealType: json['dealType'] as String,
      deal: json['deal'] as String?,
      plannedOn: json['plannedOn'] == null
          ? null
          : DateTime.parse(json['plannedOn'] as String),
      paidAt: json['paidAt'] == null
          ? null
          : DateTime.parse(json['paidAt'] as String),
      availabilityGivenAt: json['availabilityGivenAt'] == null
          ? null
          : DateTime.parse(json['availabilityGivenAt'] as String),
      confirmedAt: json['confirmedAt'] == null
          ? null
          : DateTime.parse(json['confirmedAt'] as String),
    );

Map<String, dynamic> _$MatchToJson(Match instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'matchedUsers': instance.matchedUsers,
      'city': instance.city,
      'dealType': instance.dealType,
      'deal': instance.deal,
      'plannedOn': instance.plannedOn?.toIso8601String(),
      'paidAt': instance.paidAt?.toIso8601String(),
      'availabilityGivenAt': instance.availabilityGivenAt?.toIso8601String(),
      'confirmedAt': instance.confirmedAt?.toIso8601String(),
    };
