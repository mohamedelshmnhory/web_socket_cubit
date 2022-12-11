part of 'markets_cubit.dart';

abstract class MarketsState extends Equatable {
  const MarketsState();
}

class MarketsInitial extends MarketsState {
  @override
  List<Object> get props => [];
}

class GetActiveSymbolsLoading extends MarketsState {
  @override
  List<Object> get props => [];
}

class ChangeMarketState extends MarketsState {
  @override
  List<Object> get props => [];
}

class GetActiveSymbolsSuccess extends MarketsState {
  const GetActiveSymbolsSuccess(this.response);
  final ActiveSymbolsResponse response;
  @override
  List<Object> get props => [response];
}

class GetActiveSymbolsError extends MarketsState {
  const GetActiveSymbolsError(this.msg);
  final String msg;
  @override
  List<Object> get props => [msg];
}

class GetPriceLoading extends MarketsState {
  @override
  List<Object> get props => [];
}

class GetPriceSuccess extends MarketsState {
  const GetPriceSuccess(this.response);
  final TicksStreamResponse response;
  @override
  List<Object> get props => [response];
}

class GetPriceError extends MarketsState {
  const GetPriceError(this.msg);
  final String msg;
  @override
  List<Object> get props => [msg];
}

class GetForgetRequestLoading extends MarketsState {
  @override
  List<Object> get props => [];
}

class GetForgetRequestSuccess extends MarketsState {
  const GetForgetRequestSuccess(this.response);
  final ForgetResponse response;
  @override
  List<Object> get props => [response];
}

class GetForgetRequestError extends MarketsState {
  const GetForgetRequestError(this.msg);
  final String msg;
  @override
  List<Object> get props => [msg];
}
