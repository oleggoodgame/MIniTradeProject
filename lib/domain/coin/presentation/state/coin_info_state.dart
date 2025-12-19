import 'package:mini_cash/domain/coin/model/coin_info_model.dart';

class CoinInfoState {
  final bool isLoading;
  final CoinInfo? coinInfo;
  final String? error;

  const CoinInfoState({this.isLoading = false, this.coinInfo, this.error});

  CoinInfoState copyWith({bool? isLoading, CoinInfo? coinInfo, String? error}) {
    return CoinInfoState(
      isLoading: isLoading ?? this.isLoading,
      coinInfo: coinInfo ?? this.coinInfo,
      error: error,
    );
  }
}
