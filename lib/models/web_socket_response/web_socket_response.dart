import '../active_symbols/active_symbols.dart';
import 'package:json_annotation/json_annotation.dart';

import '../error_response/error_response.dart';
import '../tick/tick.dart';
part 'web_socket_response.g.dart';

@JsonSerializable()
class WebSocketResponse {
  @JsonKey(name: 'active_symbols')
  final List<ActiveSymbols>? activeSymbols;
  final Tick? tick;
  final ErrorResponse? error;
  final int? forget;
  @JsonKey(name: 'msg_type')
  final String? msgType;

  WebSocketResponse(this.activeSymbols, this.tick, this.error, this.msgType, this.forget);

  factory WebSocketResponse.fromJson(Map<String, dynamic> json) => _$WebSocketResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WebSocketResponseToJson(this);
}
