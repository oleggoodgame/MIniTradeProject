  import 'package:flutter_riverpod/flutter_riverpod.dart';
  import 'package:mini_cash/domain/coin/data/sources/coin_trade_data.dart';
  import 'package:mini_cash/domain/coin/model/coin_trade_data.dart';
  import 'package:mini_cash/domain/coin/repository/icoin_trade_data.dart';

  final coinRepositoryDataProvider = Provider.autoDispose<IcoinTradeData>((ref) {
    final coinInfoApi = ref.watch(coinTradeApiProvider);

    return CoinRepository(coinInfoApi);
  });


  class CoinRepository extends IcoinTradeData{
    final CoinTradeApi _coinDataApi;

    CoinRepository(this._coinDataApi);


    @override
    Future<CoinTradeData> fetchTradeDataCoin(String symbol) {
      return _coinDataApi.fetchTradeDataCoin(symbol);
    }
  }