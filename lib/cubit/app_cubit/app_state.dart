part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class ActiveSymbolsInitial extends AppState {}

class ActiveSymbolsLoaded extends AppState {
  final List<String> marketsList;

  const ActiveSymbolsLoaded(this.marketsList);
}

class ErrorState extends AppState {
  const ErrorState();
}

class MarketSelected extends AppState {
  final String market;
  final List<String> symbolsList;

  const MarketSelected(this.market, this.symbolsList);
  @override
  List<Object> get props => [market, symbolsList];
}

class SymbolSelected extends AppState {
  final String symbol;
  const SymbolSelected(this.symbol);
  @override
  List<Object> get props => [symbol];
}

class TicksLoaded extends AppState {
  final double price;
  final String id;
  final Color color;
  const TicksLoaded(this.price, this.id, this.color);
  @override
  List<Object> get props => [price, id, color];
}

class TicksLoadedWithError extends AppState {
  const TicksLoadedWithError();
}
