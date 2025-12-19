import 'package:flutter_riverpod/legacy.dart';
import 'package:mini_cash/domain/coin/presentation/state/coin_info_state.dart';
import 'package:mini_cash/domain/coin/repository/coin_repository.dart';
import 'package:mini_cash/domain/coin/repository/icoin_repository.dart';

final coinInfoControllerProvider =
    StateNotifierProvider.autoDispose<CoinInfoController, CoinInfoState>((ref) {
  final repository = ref.watch(coinRepositoryProvider); 
  return CoinInfoController(repository);
});

class CoinInfoController extends StateNotifier<CoinInfoState> {
  final ICoinRepository _repository;

  CoinInfoController(this._repository) : super(const CoinInfoState());

  Future<void> loadCoinInfo(String symbol) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final coinInfo = await _repository.fetchInformationCoin(symbol);

      state = state.copyWith(
        isLoading: false,
        coinInfo: coinInfo,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}
