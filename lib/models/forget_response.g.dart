// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetResponse _$ForgetResponseFromJson(Map<String, dynamic> json) =>
    ForgetResponse(
      forget: json['forget'] as num?,
      msg_type: json['msg_type'] as String?,
      req_id: json['req_id'] as num?,
    );

Map<String, dynamic> _$ForgetResponseToJson(ForgetResponse instance) =>
    <String, dynamic>{
      'forget': instance.forget,
      'msg_type': instance.msg_type,
      'req_id': instance.req_id,
    };
