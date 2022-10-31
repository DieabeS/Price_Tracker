// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_socket_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebSocketResponse _$WebSocketResponseFromJson(Map<String, dynamic> json) =>
    WebSocketResponse(
      (json['active_symbols'] as List<dynamic>?)
          ?.map((e) => ActiveSymbols.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['tick'] == null
          ? null
          : Tick.fromJson(json['tick'] as Map<String, dynamic>),
      json['error'] == null
          ? null
          : ErrorResponse.fromJson(json['error'] as Map<String, dynamic>),
      json['msg_type'] as String?,
      json['forget'] as int?,
    );

Map<String, dynamic> _$WebSocketResponseToJson(WebSocketResponse instance) =>
    <String, dynamic>{
      'active_symbols': instance.activeSymbols,
      'tick': instance.tick,
      'error': instance.error,
      'forget': instance.forget,
      'msg_type': instance.msgType,
    };
