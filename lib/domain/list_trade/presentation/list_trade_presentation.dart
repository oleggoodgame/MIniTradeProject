import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_cash/domain/list_trade/provider/user_coin_provider.dart';
import 'package:mini_cash/entity/coin_entity.dart';
import 'package:mini_cash/websocket/binance_prices_websokcet.dart';

class ListTradePresentation extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<List<CoinEntity>>>(userCoinsProvider, (prev, next) {
      if (prev?.hasValue != true && next.hasValue) {
        final coins = next.value!;
        ref
            .read(pricesProvider.notifier)
            .init(coins.map((c) => c.symbol).toList());
      }
    });

    final coinsAsync = ref.watch(userCoinsProvider);
    final pricesAsync = ref.watch(pricesProvider);

    return GestureDetector(
      onTap: () {
        context.goNamed('coin', extra: 'BTCUSDT');
      },
      child: coinsAsync.when(
        data: (coins) {
          return pricesAsync.when(
            data: (prices) {
              return ListView(
                children: coins.map((coin) {
                  final symbol = coin.symbol;
                  final price = prices[symbol];

                  return ListTile(
                    title: Text(symbol),
                    subtitle: Text(
                      price != null
                          ? "Price: ${price.toStringAsFixed(4)}"
                          : "Loading...",
                    ),
                  );
                }).toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text("Price error: $e")),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Coins error: $e")),
      ),
    );
  }
}
