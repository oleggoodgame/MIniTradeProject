import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pricesProvider =
    StreamNotifierProvider<PricesStreamNotifier, Map<String, double>>(
      () => PricesStreamNotifier(),
    );

class PricesStreamNotifier extends StreamNotifier<Map<String, double>> {
  WebSocketChannel? _channel;
  final Map<String, double> _prices = {};

  @override
  Stream<Map<String, double>> build() {
    ref.onDispose(() {
      _channel?.sink.close();
    });

    _channel = WebSocketChannel.connect(
      Uri.parse("wss://stream.binance.com:9443/ws"),
    );

    _channel!.stream.listen((data) {
      final json = jsonDecode(data);

      if (json["s"] != null && json["c"] != null) {
        _prices[json["s"]] = double.parse(json["c"]);
        state = AsyncData({..._prices});
      }
    });

    return const Stream.empty();
  }

  Future<void> init(List<String> symbols) async {
    final initial = await _fetchAllPrices(symbols);
    _prices.addAll(initial);
    state = AsyncData({..._prices});

    subscribe(symbols);
  }

  Future<Map<String, double>> _fetchAllPrices(List<String> symbols) async {
    final response = await http.get(
      Uri.parse("https://api.binance.com/api/v3/ticker/price"),
    );

    if (response.statusCode != 200) return {};

    final List data = jsonDecode(response.body);
    final Map<String, double> result = {};

    for (final e in data) {
      final symbol = e["symbol"];
      if (symbols.contains(symbol)) {
        final price = double.parse(e["price"]);
        result[symbol] = price;
        print("INIT $symbol = $price");
      }
    }

    return result;
  }

  void subscribe(List<String> symbols) {
    final params = symbols.map((s) => "${s.toLowerCase()}@ticker").toList();
    _channel?.sink.add(
      jsonEncode({"method": "SUBSCRIBE", "params": params, "id": 1}),
    );
  }

  void dispose() {
    _channel?.sink.close();
  }
}

// ми цей клас не використовуємо
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
