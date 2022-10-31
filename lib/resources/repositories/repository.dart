import 'dart:async';
import 'dart:convert';
import '../../services/web_socket_service.dart';

class Repository {
  static Repository? _instance;
  final WebSocketService _webSocketService = WebSocketService();


  static Repository get instance {
    _instance ??= Repository();
    return _instance!;
  }

  StreamController init() {
    return _webSocketService.streamController;
  }

  getActiveSymbols() {
    _webSocketService.channel.sink.add(json.encode({"active_symbols": "brief", "product_type": "basic"}));

  }

  getTicks({required String symbol}) {

    _webSocketService.channel.sink.add(json.encode({"ticks": symbol, "subscribe": 1}));

  }

  forget({required String id}) {
    _webSocketService.channel.sink.add(json.encode({"forget": id}));
  }
}
