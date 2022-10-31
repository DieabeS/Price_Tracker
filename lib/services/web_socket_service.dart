import 'dart:async';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  late final WebSocketChannel channel;
  late final StreamController streamController;
  WebSocketService() {
    channel = WebSocketChannel.connect(
      Uri.parse("wss://ws.binaryws.com/websockets/v3?app_id=32534"),
    );
    streamController = StreamController.broadcast();
    streamController.addStream(channel.stream);
  }
}
