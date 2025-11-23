import 'dart:convert';

import 'package:http/http.dart' as http;

class CoinsRemoteDataSource {
  Future<List<Map<String, String>>> loadCoins() async {
    final url = Uri.parse('https://api.binance.com/api/v3/exchangeInfo');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Binance API error");
    }

    final data = jsonDecode(response.body);
    final symbols = data['symbols'] as List<dynamic>;

    const trackedQuotes = {"USDT", "USD"};

    return symbols
        .where((s) =>
            s['status'] == 'TRADING' &&
            trackedQuotes.contains(s['quoteAsset']))
        .map((s) => {
              "symbol": s['symbol'] as String,
              "baseAsset": s['baseAsset'] as String,
              "quoteAsset": s['quoteAsset'] as String,
            })
        .toList();
  }
}

