import 'package:json_annotation/json_annotation.dart';

part 'active_symbols_response.g.dart';

@JsonSerializable()
class ActiveSymbolsResponse {
  List<ActiveSymbol>? active_symbols;
  Echo_req? echo_req;
  String? msg_type;
  num? req_id;

  ActiveSymbolsResponse({this.active_symbols, this.echo_req, this.msg_type, this.req_id});

  factory ActiveSymbolsResponse.fromJson(Map<String, dynamic> json) => _$ActiveSymbolsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveSymbolsResponseToJson(this);
}

@JsonSerializable()
class Echo_req {
  String? active_symbols;
  String? product_type;
  num? req_id;

  Echo_req({this.active_symbols, this.product_type, this.req_id});

  factory Echo_req.fromJson(Map<String, dynamic> json) => _$Echo_reqFromJson(json);

  Map<String, dynamic> toJson() => _$Echo_reqToJson(this);
}

@JsonSerializable()
class ActiveSymbol {
  num? allow_forward_starting;
  String? display_name;
  num? display_order;
  num? exchange_is_open;
  num? is_trading_suspended;
  String? market;
  String? market_display_name;
  num? pip;
  String? subgroup;
  String? subgroup_display_name;
  String? submarket;
  String? submarket_display_name;
  String? symbol;
  String? symbol_type;

  ActiveSymbol(
      {this.allow_forward_starting,
      this.display_name,
      this.display_order,
      this.exchange_is_open,
      this.is_trading_suspended,
      this.market,
      this.market_display_name,
      this.pip,
      this.subgroup,
      this.subgroup_display_name,
      this.submarket,
      this.submarket_display_name,
      this.symbol,
      this.symbol_type});

  factory ActiveSymbol.fromJson(Map<String, dynamic> json) => _$ActiveSymbolFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveSymbolToJson(this);
}
