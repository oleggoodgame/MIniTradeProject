import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'bid_ask_provider.g.dart';

@riverpod
class BidAskCounter extends _$BidAskCounter {

  @override
  List<Map<Map<double, double>, Map<double, double>>> build() => [];

  void addBidAsk({
    required double bidQty,
    required double bidPrice,
    required double askQty,
    required double askPrice,
  }) {
    final newEntry = {
      {bidQty: bidPrice}: {askQty: askPrice},
    };

    state = [...state, newEntry];

    if (state.length > 100) {
      state = state.sublist(state.length - 50);
    }
  }

  void clear() {
    state = [];
  }
}
