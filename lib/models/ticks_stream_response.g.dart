// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticks_stream_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicksStreamResponse _$TicksStreamResponseFromJson(Map<String, dynamic> json) =>
    TicksStreamResponse(
      msg_type: json['msg_type'] as String?,
      subscription: json['subscription'] == null
          ? null
          : Subscription.fromJson(json['subscription'] as Map<String, dynamic>),
      tick: json['tick'] == null
          ? null
          : Tick.fromJson(json['tick'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TicksStreamResponseToJson(
        TicksStreamResponse instance) =>
    <String, dynamic>{
      'msg_type': instance.msg_type,
      'subscription': instance.subscription,
      'tick': instance.tick,
    };

Tick _$TickFromJson(Map<String, dynamic> json) => Tick(
      ask: json['ask'] as num?,
      bid: json['bid'] as num?,
      epoch: json['epoch'] as num?,
      id: json['id'] as String?,
      pip_size: json['pip_size'] as num?,
      quote: json['quote'] as num?,
      symbol: json['symbol'] as String?,
    );

Map<String, dynamic> _$TickToJson(Tick instance) => <String, dynamic>{
      'ask': instance.ask,
      'bid': instance.bid,
      'epoch': instance.epoch,
      'id': instance.id,
      'pip_size': instance.pip_size,
      'quote': instance.quote,
      'symbol': instance.symbol,
    };

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) => Subscription(
      id: json['id'] as String?,
    );

Map<String, dynamic> _$SubscriptionToJson(Subscription instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
