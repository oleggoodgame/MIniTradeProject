import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_cash/domain/list_trade/provider/user_coin_provider.dart';
import 'package:mini_cash/entity/coin_entity.dart';
import 'package:mini_cash/websocket/binance_prices_websokcet.dart';

class ListTradePresentation extends ConsumerWidget {
  const ListTradePresentation({super.key});

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
    ref.invalidate(userCoinsProvider);
    ref.invalidate(pricesProvider);

    final coinsAsync = ref.watch(userCoinsProvider);
    final pricesAsync = ref.watch(pricesProvider);

    return coinsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text("Coins error: $e")),
      data: (coins) {
        return pricesAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text("Price error: $e")),
          data: (prices) {
            return ListView.builder(
              itemCount: coins.length,
              itemBuilder: (context, index) {
                final coin = coins[index];
                final symbol = coin.symbol;
                final price = prices[symbol];

                return ListTile(
                  title: Text(symbol),
                  subtitle: Text(
                    price != null
                        ? "Price: ${price.toStringAsFixed(4)}"
                        : "Loading...",
                  ),
                  onTap: () {
                    context.pushNamed('coin', extra: coin);
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
