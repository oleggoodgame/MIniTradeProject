import 'package:mini_cash/domain/coin/model/coin_info_model.dart';

abstract class ICoinRepository {
  Future<CoinInfo> fetchInformationCoin(String symbol);// поміняти
  // Future<List<String>> fetchTradeDataCoin(String symbol);// поміняти
}
