import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mini_cash/domain/coin/repository/iticker_repository.dart';
import 'package:mini_cash/entity/ticker_entity.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final tickerRepositoryProvider =
    StreamNotifierProvider<BinanceCoinRepository, TickerEntity>(
      () => BinanceCoinRepository(),
    );

class BinanceCoinRepository extends StreamNotifier<TickerEntity>
    implements ItickerRepository {
  WebSocketChannel? _channel;

  @override
  Stream<TickerEntity> build() {
    ref.onDispose(() {
      _channel?.sink.close();
    });
    return const Stream.empty();
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
