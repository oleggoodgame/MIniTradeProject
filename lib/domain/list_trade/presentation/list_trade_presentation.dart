import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/domain/list_trade/provider/user_coin_provider.dart';
import 'package:mini_cash/websocket/binance_websokcet.dart';

class ListTradePresentation extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coinsAsync = ref.watch(userCoinsProvider);

    return coinsAsync.when(
      data: (coins) {
        // Підписуємо одноразово після побудови UI
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(pricesProvider.notifier).subscribe(
            coins.map((c) => c.symbol).toList(),  // ← ТУТ важливо
          );
        });

        final pricesStream = ref.watch(pricesProvider);

        return pricesStream.when(
          data: (prices) {
            return ListView(
              children: coins.map((coin) {
                final symbol = coin.symbol;
                final price = prices[symbol] ?? 0;

                return ListTile(
                  title: Text(symbol),
                  subtitle: Text("Price: $price"),
                );
              }).toList(),
            );
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error: (err, stack) {
            print("PRICE PROVIDER ERROR: $err");
            print(stack);
            return Center(child: Text("Error loading prices"));
          },
        );
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (err, stack) {
        print("COINS LOADING ERROR: $err");
        print(stack);
        return Center(child: Text("Error loading coins"));
      },
    );
  }
}
