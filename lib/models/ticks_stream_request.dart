import 'package:json_annotation/json_annotation.dart';

part 'ticks_stream_request.g.dart';

@JsonSerializable(includeIfNull: false)
class TicksStreamRequest {
  String ticks;
  num? subscribe;

  TicksStreamRequest({required this.ticks,  this.subscribe});

  factory TicksStreamRequest.fromJson(Map<String, dynamic> json) => _$TicksStreamRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TicksStreamRequestToJson(this);
}

