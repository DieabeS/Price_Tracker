// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_symbols.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveSymbols _$ActiveSymbolsFromJson(Map<String, dynamic> json) =>
    ActiveSymbols(
      json['allow_forward_starting'],
      json['display_name'] as String?,
      json['exchange_is_open'],
      json['is_trading_suspended'],
      json['market'] as String?,
      json['market_display_name'] as String?,
      (json['pip'] as num?)?.toDouble(),
      json['submarket'] as String?,
      json['submarket_display_name'] as String?,
      json['symbol'] as String?,
      json['symbol_type'] as String?,
    );

Map<String, dynamic> _$ActiveSymbolsToJson(ActiveSymbols instance) =>
    <String, dynamic>{
      'allow_forward_starting': instance.allowForwardStarting,
      'display_name': instance.displayName,
      'exchange_is_open': instance.exchangeIsOpen,
      'is_trading_suspended': instance.isTradingSuspended,
      'market': instance.market,
      'market_display_name': instance.marketDisplayName,
      'pip': instance.pip,
      'submarket': instance.submarket,
      'submarket_display_name': instance.submarketDisplayName,
      'symbol': instance.symbol,
      'symbol_type': instance.symbolType,
    };
