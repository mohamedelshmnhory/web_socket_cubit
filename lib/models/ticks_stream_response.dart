import 'package:json_annotation/json_annotation.dart';

part 'ticks_stream_response.g.dart';

@JsonSerializable()
class TicksStreamResponse {
  String? msg_type;
  Subscription? subscription;
  Tick? tick;

  TicksStreamResponse({this.msg_type, this.subscription, this.tick});

  factory TicksStreamResponse.fromJson(Map<String, dynamic> json) => _$TicksStreamResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TicksStreamResponseToJson(this);
}

@JsonSerializable()
class Tick {
  num? ask;
  num? bid;
  num? epoch;
  String? id;
  num? pip_size;
  num? quote;
  String? symbol;

  Tick({this.ask, this.bid, this.epoch, this.id, this.pip_size, this.quote, this.symbol});

  factory Tick.fromJson(Map<String, dynamic> json) => _$TickFromJson(json);

  Map<String, dynamic> toJson() => _$TickToJson(this);
}

@JsonSerializable()
class Subscription {
  String? id;

  Subscription({this.id});

  factory Subscription.fromJson(Map<String, dynamic> json) => _$SubscriptionFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);
}
