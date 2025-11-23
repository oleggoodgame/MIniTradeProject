import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pricesProvider = StreamNotifierProvider<PricesStreamNotifier, Map<String, double>>(
  () => PricesStreamNotifier(),
);

class PricesStreamNotifier extends StreamNotifier<Map<String, double>> {
  WebSocketChannel? _channel;

  @override
  Stream<Map<String, double>> build() {
    final controller = StreamController<Map<String, double>>();
    final prices = <String, double>{};

    _channel = WebSocketChannel.connect(
      Uri.parse("wss://stream.binance.com:9443/ws"),
    );

    _channel!.stream.listen((data) {
      final json = jsonDecode(data);
      if (json is Map && json["s"] != null && json["c"] != null) {
        final symbol = json["s"];
        final price = double.tryParse(json["c"]) ?? 0;
        prices[symbol] = price;
        controller.add({...prices});
      }
    });

    return controller.stream;
  }

  void subscribe(List<String> symbols) {
    if (_channel == null) return;
    final params = symbols.map((s) => "${s.toLowerCase()}@ticker").toList();
    _channel!.sink.add(jsonEncode({"method": "SUBSCRIBE", "params": params, "id": 1}));
  }

  void dispose() {
    _channel?.sink.close();
  }
}
// ми цей клас не використовуємо?
// class BinanceWebSocketService {
//   WebSocketChannel? _channel;

//   void connect() {
//     _channel = WebSocketChannel.connect(
//       Uri.parse("wss://stream.binance.com:9443/ws"),
//     );
//   }

//   /// Підписка на багато символів
//   void subscribe(List<String> symbols) {
//     if (_channel == null) connect();

//     final params = symbols
//         .map((s) => s.toLowerCase() + "@ticker")
//         .toList();

//     final payload = {
//       "method": "SUBSCRIBE",
//       "params": params,
//       "id": 1
//     };

//     print("Subscribing: $params");

//     _channel!.sink.add(jsonEncode(payload));
//   }

//   Stream get stream => _channel!.stream;

//   void dispose() {
//     _channel?.sink.close();
//   }
// }
