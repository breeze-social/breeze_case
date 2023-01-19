// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => ApiResponse(
      statusCode: json['statusCode'] as int,
      data: json['data'] ?? const {},
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'data': instance.data,
      'errorMessage': instance.errorMessage,
    };
