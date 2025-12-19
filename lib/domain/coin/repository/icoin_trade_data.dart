import 'package:mini_cash/domain/coin/model/coin_trade_data.dart';

abstract class IcoinTradeData {
  Future<CoinTradeData> fetchTradeDataCoin(String symbol);
}