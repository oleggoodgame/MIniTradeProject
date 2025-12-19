import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/domain/coin/data/sources/coin_info_api.dart';
import 'package:mini_cash/domain/coin/model/coin_info_model.dart';
import 'package:mini_cash/domain/coin/repository/icoin_repository.dart';

final coinRepositoryProvider = Provider.autoDispose<ICoinRepository>((ref) {
  final coinInfoApi = ref.watch(coinInfoApiProvider);

  return CoinRepository(coinInfoApi);
});


class CoinRepository extends ICoinRepository{
  final CoinInfoApi _coinInfoApi;

  CoinRepository(this._coinInfoApi);

  @override
  Future<CoinInfo> fetchInformationCoin(String symbol) {
    return _coinInfoApi.fetchInformationCoin(symbol);
  }
}