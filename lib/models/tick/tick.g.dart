// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tick.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tick _$TickFromJson(Map<String, dynamic> json) => Tick(
      (json['ask'] as num?)?.toDouble(),
      (json['bid'] as num?)?.toDouble(),
      json['id'] as String?,
      (json['quote'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TickToJson(Tick instance) => <String, dynamic>{
      'ask': instance.ask,
      'bid': instance.bid,
      'quote': instance.quote,
      'id': instance.id,
    };
