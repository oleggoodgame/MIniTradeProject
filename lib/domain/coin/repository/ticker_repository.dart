import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mini_cash/entity/ticker_entity.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final tickerStreamProvider =
    StreamNotifierProvider.family<TickerStreamNotifier, TickerEntity, String>(
      (symbol) => TickerStreamNotifier(symbol: 'BTCUSDT'),
    );

class TickerStreamNotifier extends StreamNotifier<TickerEntity> {
  WebSocketChannel? _channel;
  final String symbol;

  TickerStreamNotifier({required this.symbol});
  @override
  Stream<TickerEntity> build() async* {
    // REST
    final res = await http.get(
      Uri.parse('https://api.binance.com/api/v3/ticker/24hr?symbol=$symbol'),
    );

    yield TickerEntity.fromRestJson(jsonDecode(res.body));

    // WebSocket
    final channel = WebSocketChannel.connect(
      Uri.parse("wss://stream.binance.com:9443/ws"),
    );

    ref.onDispose(() => channel.sink.close());

    channel.sink.add(
      jsonEncode({
        "method": "SUBSCRIBE",
        "params": ["${symbol.toLowerCase()}@ticker"],
        "id": 1,
      }),
    );

    await for (final event in channel.stream) {
      final json = jsonDecode(event);
      if (json['e'] != '24hrTicker') continue;

      yield TickerEntity.fromWsJson(json);
    }
  }

  Future<void> init(String symbol) async {
    final ticker = await fetchTicker(symbol);
    state = AsyncData(ticker);

    tickerStream(symbol);
  }

  @override
  Future<TickerEntity> fetchTicker(String symbol) async {
    final res = await http.get(
      Uri.parse('https://api.binance.com/api/v3/ticker/24hr?symbol=$symbol'),
    );

    final data = jsonDecode(res.body);
    print(data);
    return TickerEntity.fromRestJson(data);
  }

  @override
  void tickerStream(String symbol) {
    _channel ??= WebSocketChannel.connect(
      Uri.parse("wss://stream.binance.com:9443/ws"),
    );

    _channel!.sink.add(
      jsonEncode({
        "method": "SUBSCRIBE",
        "params": ["${symbol.toLowerCase()}@ticker"],
        "id": 1,
      }),
    );
    if (!_channel!.stream.isBroadcast) {
      _channel!.stream.listen((event) {
        // тут помилка викликаєтсья StateError (Bad state: Stream has already been listened to.)
        final json = jsonDecode(event);

        if (json['e'] != '24hrTicker') return;

        state = AsyncData(TickerEntity.fromWsJson(json));
      });
      // }catch (ex){
      //   print(ex);
      // }
    }
  }
}
