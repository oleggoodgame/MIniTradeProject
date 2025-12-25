import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mini_cash/domain/coin/model/coin_trade_data.dart';
import 'package:mini_cash/domain/coin/repository/icoin_trade_data.dart';

final coinTradeApiProvider = Provider.autoDispose<CoinTradeApi>((ref) {
  return CoinTradeApi();
});

class CoinTradeApi implements IcoinTradeData {
  static const _baseUrl = 'https://api.binance.com/api/v3/klines';

  @override
  Future<CoinTradeData> fetchTradeDataCoin(String symbol) async {
    final uri = Uri.parse('$_baseUrl?symbol=$symbol&interval=1d&limit=1');
    final response = await http.get(uri);
    if (response.statusCode != 200) throw Exception('Binance API error');

    final decoded = jsonDecode(response.body) as List<dynamic>;
    if (decoded.isEmpty) throw Exception('No data returned');

    final kline = decoded[0] as List<dynamic>;

    return CoinTradeData.fromKline(kline);
  }
}
