import 'package:json_annotation/json_annotation.dart';

part 'active_symbols.g.dart';

@JsonSerializable()
class ActiveSymbols {
  @JsonKey(name: 'allow_forward_starting')
  final dynamic allowForwardStarting;
  @JsonKey(name: 'display_name')
  final String? displayName;
  @JsonKey(name: 'exchange_is_open')
  final dynamic exchangeIsOpen;
  @JsonKey(name: "is_trading_suspended")
  final dynamic isTradingSuspended;
  final String? market;
  @JsonKey(name: "market_display_name")
  final String? marketDisplayName;
  final double? pip;
  final String? submarket;
  @JsonKey(name: "submarket_display_name")
  final String? submarketDisplayName;
  final String? symbol;
  @JsonKey(name: "symbol_type")
  final String? symbolType;

  ActiveSymbols(this.allowForwardStarting, this.displayName, this.exchangeIsOpen, this.isTradingSuspended, this.market,
      this.marketDisplayName, this.pip, this.submarket, this.submarketDisplayName, this.symbol, this.symbolType);

  factory ActiveSymbols.fromJson(Map<String, dynamic> json) => _$ActiveSymbolsFromJson(json);
  Map<String, dynamic> toJson() => _$ActiveSymbolsToJson(this);
}
