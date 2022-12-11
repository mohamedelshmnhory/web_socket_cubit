import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:markets/models/active_symbols_request.dart';
import 'package:markets/models/active_symbols_response.dart';
import 'package:markets/models/forget_request.dart';
import 'package:markets/models/ticks_stream_response.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../models/forget_response.dart';
import '../models/ticks_stream_request.dart';

part 'markets_state.dart';

final url = Uri.parse('wss://ws.binaryws.com/websockets/v3?app_id=1089');

@injectable
class MarketsCubit extends Cubit<MarketsState> {
  MarketsCubit() : super(MarketsInitial());

  WebSocketChannel activeSymbolsChannel = WebSocketChannel.connect(url);
  WebSocketChannel priceChannel = WebSocketChannel.connect(url);
  WebSocketChannel forgetChannel = WebSocketChannel.connect(url);

  ActiveSymbolsResponse? activeSymbolsResponse;
  TicksStreamResponse? ticksStreamResponse;
  String? selectedMarket;
  String? selectedSymbol;
  Map<String, List<ActiveSymbol>> markets = {};

  void changeMarket(String market) {
    selectedMarket = market;
    selectedSymbol = null;
    if (ticksStreamResponse?.subscription?.id != null) {
      forgetRequest(ticksStreamResponse!.subscription!.id!);
    }
    initChannels();
    emit(ChangeMarketState());
  }

  void getActiveSymbols() {
    emit(GetActiveSymbolsLoading());
    activeSymbolsChannel.sink.add(
      jsonEncode(ActiveSymbolsRequest(active_symbols: 'brief', product_type: 'basic').toJson()),
    );
    activeSymbolsChannel.stream.forEach(
      (value) {
        activeSymbolsResponse = ActiveSymbolsResponse.fromJson(jsonDecode(value));
        if (activeSymbolsResponse?.msg_type == 'active_symbols') {
          activeSymbolsResponse?.active_symbols?.forEach((element) {
            if (element.market != null) {
              markets.update(
                element.market!,
                (value) {
                  value.add(element);
                  return value;
                },
                ifAbsent: () => [element],
              );
            }
          });
          selectedMarket = activeSymbolsResponse?.active_symbols?.first.market;
          emit(GetActiveSymbolsSuccess(activeSymbolsResponse!));
        } else {
          emit(GetActiveSymbolsError(activeSymbolsResponse?.msg_type ?? 'error'));
        }
      },
    );
  }

  void getPrice(String symbol) {
    emit(GetPriceLoading());
    initChannels();
    if (ticksStreamResponse?.subscription?.id != null) {
      forgetRequest(ticksStreamResponse!.subscription!.id!);
    }
    priceChannel.sink.add(
      jsonEncode(TicksStreamRequest(ticks: symbol, subscribe: 1).toJson()),
    );
    priceChannel.stream.listen((value) {
      ticksStreamResponse = TicksStreamResponse.fromJson(jsonDecode(value));
      if (ticksStreamResponse?.msg_type == 'tick') {
        emit(GetPriceSuccess(ticksStreamResponse!));
      } else {
        emit(GetPriceError(activeSymbolsResponse?.msg_type ?? 'error'));
      }
    });
  }

  void forgetRequest(String id) {
    emit(GetForgetRequestLoading());
    forgetChannel.sink.add(
      jsonEncode(ForgetRequest(forget: id).toJson()),
    );
  }

  void initChannels() async {
    closeChannels();
    activeSymbolsChannel = WebSocketChannel.connect(url);
    priceChannel = WebSocketChannel.connect(url);
    forgetChannel = WebSocketChannel.connect(url);
  }

  void closeChannels() {
    activeSymbolsChannel.sink.close();
    priceChannel.sink.close();
    forgetChannel.sink.close();
  }
}
