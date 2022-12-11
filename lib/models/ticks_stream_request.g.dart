// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticks_stream_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicksStreamRequest _$TicksStreamRequestFromJson(Map<String, dynamic> json) =>
    TicksStreamRequest(
      ticks: json['ticks'] as String,
      subscribe: json['subscribe'] as num?,
    );

Map<String, dynamic> _$TicksStreamRequestToJson(TicksStreamRequest instance) {
  final val = <String, dynamic>{
    'ticks': instance.ticks,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('subscribe', instance.subscribe);
  return val;
}
