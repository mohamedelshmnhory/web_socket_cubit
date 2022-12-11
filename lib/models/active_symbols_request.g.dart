// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_symbols_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveSymbolsRequest _$ActiveSymbolsRequestFromJson(
        Map<String, dynamic> json) =>
    ActiveSymbolsRequest(
      active_symbols: json['active_symbols'] as String,
      product_type: json['product_type'] as String?,
    );

Map<String, dynamic> _$ActiveSymbolsRequestToJson(
    ActiveSymbolsRequest instance) {
  final val = <String, dynamic>{
    'active_symbols': instance.active_symbols,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('product_type', instance.product_type);
  return val;
}
