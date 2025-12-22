import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/domain/coin/presentation/f_chart/price_chart.dart';
import 'package:mini_cash/domain/coin/provider/bid_ask_provider.dart';
import 'package:mini_cash/domain/coin/provider/f_chart_provider.dart';
import 'package:mini_cash/domain/coin/repository/ticker_repository.dart';

class CoinPricePresentation extends ConsumerStatefulWidget {
  final String symbol;
  const CoinPricePresentation({super.key, required this.symbol});

  @override
  ConsumerState<CoinPricePresentation> createState() =>
      _CoinPricePresentationState();
}

class _CoinPricePresentationState extends ConsumerState<CoinPricePresentation> {
  // @override
  // void initState() {
  //   super.initState();

  //   ref.read(tickerRepositoryProvider.notifier).init("BTCUSDT");
  // }

  @override
  Widget build(BuildContext context) {
    tickerStreamProvider;
    final tickerAsync = ref.watch(tickerStreamProvider(widget.symbol));
    // final spots = ref.watch(counterProvider.notifier);
    // final bid_ask = ref.watch(bidAskCounterProvider.notifier);
    ref.listen(tickerStreamProvider(widget.symbol), (previous, next) {
      next.whenOrNull(
        data: (ticker) {
          ref
              .read(bidAskCounterProvider.notifier)
              .addBidAsk(
                bidQty: ticker.bidQty,
                bidPrice: ticker.bidPrice,
                askQty: ticker.askQty,
                askPrice: ticker.askPrice,
              );

          ref.read(counterProvider.notifier).addPrice(ticker.lastPrice);
        },
      );
    });

    return tickerAsync.when(
      data: (ticker) {
        // spots.addPrice(ticker.lastPrice);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Price: ${ticker.lastPrice}"),
                      Text("${ticker.priceChangePercent}%"),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Max. price in 24 hours: ${ticker.highPrice}"),
                      Text("Low. price in 24 hours: ${ticker.lowPrice}"),
                    ],
                  ),
                ),
              ],
            ),
            PriceChart(),
            Text(""),
            Expanded(
              child: Consumer(
                builder: (context, ref, _) {
                  final data = ref.watch(bidAskCounterProvider);
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final entry = data[index].entries.first;
                      final bid = entry.key.entries.first;
                      final ask = entry.value.entries.first;

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("${bid.key}  ${bid.value}"),
                            ), // тут поміняти треба буде
                            Expanded(
                              child: Text("${ask.key}  ${ask.value}"),
                            ), // тут поміняти треба буде
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
      loading: () => Center(child: const CircularProgressIndicator()),
      error: (e, _) => Center(child: Text("Error: $e")),
    );
  }
}
