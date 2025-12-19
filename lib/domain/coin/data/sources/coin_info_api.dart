import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mini_cash/domain/coin/model/coin_info_model.dart';
import 'package:mini_cash/domain/coin/repository/icoin_repository.dart';

final coinInfoApiProvider= Provider.autoDispose<CoinInfoApi>((ref) {
  return CoinInfoApi();
});

class CoinInfoApi implements ICoinRepository {
  static const _baseUrl1 =
      'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest';
  static const _baseUrl2 =
      'https://pro-api.coinmarketcap.com/v2/cryptocurrency/info';
  static const _api = "f896a5b76b204c22a196af32c7eaaeab";

  Future<CoinInfo> fetchInformationCoin(String symbol) async {
    final infoUri = Uri.parse('$_baseUrl2?symbol=$symbol');
    final infoResp = await http.get(
      infoUri,
      headers: {'X-CMC_PRO_API_KEY': _api, 'Accept': 'application/json'},
    );
    if (infoResp.statusCode != 200) throw Exception('CMC info error');
    final infoDecoded = jsonDecode(infoResp.body);
    final infoJson = infoDecoded['data'][symbol][0];
    CoinInfo coin = CoinInfo.fromInfoJson(infoJson);

    final quoteUri = Uri.parse('$_baseUrl1?symbol=$symbol');
    final quoteResp = await http.get(
      quoteUri,
      headers: {'X-CMC_PRO_API_KEY': _api, 'Accept': 'application/json'},
    );
    if (quoteResp.statusCode != 200) throw Exception('CMC quote error');
    final quoteDecoded = jsonDecode(quoteResp.body);
    final quoteJson = quoteDecoded['data'][symbol];

    coin = coin.copyWithQuoteJson(quoteJson);

    return coin;
  }
}
