// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_symbols_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveSymbolsResponse _$ActiveSymbolsResponseFromJson(
        Map<String, dynamic> json) =>
    ActiveSymbolsResponse(
      active_symbols: (json['active_symbols'] as List<dynamic>?)
          ?.map((e) => ActiveSymbol.fromJson(e as Map<String, dynamic>))
          .toList(),
      echo_req: json['echo_req'] == null
          ? null
          : Echo_req.fromJson(json['echo_req'] as Map<String, dynamic>),
      msg_type: json['msg_type'] as String?,
      req_id: json['req_id'] as num?,
    );

Map<String, dynamic> _$ActiveSymbolsResponseToJson(
        ActiveSymbolsResponse instance) =>
    <String, dynamic>{
      'active_symbols': instance.active_symbols,
      'echo_req': instance.echo_req,
      'msg_type': instance.msg_type,
      'req_id': instance.req_id,
    };

Echo_req _$Echo_reqFromJson(Map<String, dynamic> json) => Echo_req(
      active_symbols: json['active_symbols'] as String?,
      product_type: json['product_type'] as String?,
      req_id: json['req_id'] as num?,
    );

Map<String, dynamic> _$Echo_reqToJson(Echo_req instance) => <String, dynamic>{
      'active_symbols': instance.active_symbols,
      'product_type': instance.product_type,
      'req_id': instance.req_id,
    };

ActiveSymbol _$ActiveSymbolFromJson(Map<String, dynamic> json) => ActiveSymbol(
      allow_forward_starting: json['allow_forward_starting'] as num?,
      display_name: json['display_name'] as String?,
      display_order: json['display_order'] as num?,
      exchange_is_open: json['exchange_is_open'] as num?,
      is_trading_suspended: json['is_trading_suspended'] as num?,
      market: json['market'] as String?,
      market_display_name: json['market_display_name'] as String?,
      pip: json['pip'] as num?,
      subgroup: json['subgroup'] as String?,
      subgroup_display_name: json['subgroup_display_name'] as String?,
      submarket: json['submarket'] as String?,
      submarket_display_name: json['submarket_display_name'] as String?,
      symbol: json['symbol'] as String?,
      symbol_type: json['symbol_type'] as String?,
    );

Map<String, dynamic> _$ActiveSymbolToJson(ActiveSymbol instance) =>
    <String, dynamic>{
      'allow_forward_starting': instance.allow_forward_starting,
      'display_name': instance.display_name,
      'display_order': instance.display_order,
      'exchange_is_open': instance.exchange_is_open,
      'is_trading_suspended': instance.is_trading_suspended,
      'market': instance.market,
      'market_display_name': instance.market_display_name,
      'pip': instance.pip,
      'subgroup': instance.subgroup,
      'subgroup_display_name': instance.subgroup_display_name,
      'submarket': instance.submarket,
      'submarket_display_name': instance.submarket_display_name,
      'symbol': instance.symbol,
      'symbol_type': instance.symbol_type,
    };
