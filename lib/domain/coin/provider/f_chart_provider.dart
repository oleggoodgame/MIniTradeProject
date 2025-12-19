import 'package:fl_chart/fl_chart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'f_chart_provider.g.dart';

@riverpod
class Counter extends _$Counter {
  int _x = 0;

  @override
  List<FlSpot> build() => [];

  void addPrice(double price) {
    final newSpot = FlSpot(_x.toDouble(), price);
    _x++;

    state = [...state, newSpot];

    if (state.length > 100) {
      state = state.sublist(state.length - 50);
    }
  }

  void clear() {
    _x = 0;
    state = [];
  }
}
