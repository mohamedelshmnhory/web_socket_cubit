import 'package:json_annotation/json_annotation.dart';

part 'active_symbols_request.g.dart';

@JsonSerializable(includeIfNull: false)
class ActiveSymbolsRequest {
  String active_symbols;
  String? product_type;

  ActiveSymbolsRequest({required this.active_symbols, this.product_type});

  factory ActiveSymbolsRequest.fromJson(Map<String, dynamic> json) => _$ActiveSymbolsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveSymbolsRequestToJson(this);
}
