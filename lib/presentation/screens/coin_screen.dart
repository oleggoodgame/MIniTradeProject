import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/domain/coin/presentation/coin_info_presentation.dart';
import 'package:mini_cash/domain/coin/presentation/coin_price_presentation.dart';
import 'package:mini_cash/domain/coin/presentation/coin_tradeData_presentation.dart';


class CoinScreen extends ConsumerStatefulWidget {
  final String symbol; // параметр для монети
  const CoinScreen({super.key, required this.symbol});

  @override
  ConsumerState<CoinScreen> createState() => _CoinScreenState();
}

class _CoinScreenState extends ConsumerState<CoinScreen> {
  @override
  void initState() {
    super.initState();

    // Запускаємо провайдер на початку
    // Future.microtask(() {
    //   ref.read(priceStreamProvider.notifier).subscribe(widget.symbol);
    // });
  }

  @override
  Widget build(BuildContext context) {
    // final prices = ref.watch(priceStreamProvider);
    // prices.subscribe(widget.symbol);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.symbol), // показуємо символ
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Chart'),
              Tab(text: 'News'),
              Tab(text: 'trade data'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const CoinPricePresentation(),
             CoinInfoPresentation(symbol: "BTC"), //widget.symbol
            CoinTradedataPresentation(symbol: "BTCUSDT",),
          ],
        ),
      ),
    );
  }
}
