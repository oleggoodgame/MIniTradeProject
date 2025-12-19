// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:mini_cash/entity/ticker_entity.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final priceStreamProvider =
//     StreamNotifierProvider<PriceStreamNotifier, TickerEntity>(
//       () => PriceStreamNotifier(),
//     );

// class PriceStreamNotifier extends StreamNotifier<TickerEntity> {
//   WebSocketChannel? _channel;

//   @override
//   Stream<TickerEntity> build() {
//     ref.onDispose(() {
//       _channel?.sink.close();
//     });

//     _channel = WebSocketChannel.connect(
//       Uri.parse("wss://stream.binance.com:9443/ws"),
//     );

//     _channel!.stream.listen((data) {
//       final json = jsonDecode(data);

//       final ticker = TickerEntity.fromJson(json);
//       state = AsyncData(ticker);
//     });

//     return const Stream.empty();
//   }

//   // Future<void> init(List<String> symbols) async {
//   //   final initial = await _fetchAllPrices(symbols);
//   //   _prices.addAll(initial);
//   //   state = AsyncData({..._prices});

//   //   subscribe(symbols);
//   // }

//   Future<TickerEntity?> fetchTicker(String symbol) async {
//     final url = Uri.parse(
//       'https://api.binance.com/api/v3/ticker/24hr?symbol=$symbol',
//     );
//     final res = await http.get(url);

//     if (res.statusCode != 200) return null;

//     final data = jsonDecode(res.body);
//     return TickerEntity.fromJson(data);
//   }

//   void subscribe(String symbol) {
//     final params = ["${symbol.toLowerCase()}@ticker"];
//     _channel?.sink.add(
//       jsonEncode({"method": "SUBSCRIBE", "params": params, "id": 1}),
//     );
//   }

//   void dispose() {
//     _channel?.sink.close();
//   }
// }
