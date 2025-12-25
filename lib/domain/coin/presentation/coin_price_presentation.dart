import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/data/style/style.dart';
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
  @override
  void initState() {
    // ref.invalidate(tickerStreamProvider(widget.symbol));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ref.invalidate(tickerStreamProvider(widget.symbol));
    final tickerAsync = ref.watch(tickerStreamProvider(widget.symbol));
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
                      Text(
                        "Price: ${ticker.lastPrice}",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      ticker.priceChangePercent.toString().startsWith('-')
                          ? Text(
                              "${ticker.priceChangePercent}%",
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(color: Colors.red),
                            )
                          : Text(
                              "${ticker.priceChangePercent}%",
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(color: Colors.green),
                            ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Max. price in 24 hours: ${ticker.highPrice}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "Low. price in 24 hours: ${ticker.lowPrice}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            PriceChart(),
            Center(
              child: Text(
                "All you see only working on 24 hour data receive, and after new price data about coin",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: kMedium),
            Text(
              "Bid / Ask counter:",
              style: Theme.of(context).textTheme.titleMedium,
            ),
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
                              child: Row(
                                children: [
                                  Text(
                                    "${bid.key}",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                  Spacer(),
                                  Text(
                                    "${bid.value} ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.green),
                                  ),
                                ],
                              ),
                              // child: Text("${bid.key}  ${bid.value}"),
                            ), // тут поміняти треба буде
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    " ${ask.key}",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                  Spacer(),
                                  Text(
                                    "${ask.value}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.red),
                                  ),
                                ],
                              ),
                              // child: Text("${ask.key}  ${ask.value}"),
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
