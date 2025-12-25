  import 'package:flutter/material.dart';
  import 'package:flutter_riverpod/flutter_riverpod.dart';
  import 'package:mini_cash/domain/coin/presentation/coin_info_presentation.dart';
  import 'package:mini_cash/domain/coin/presentation/coin_price_presentation.dart';
  import 'package:mini_cash/domain/coin/presentation/coin_tradeData_presentation.dart';
  import 'package:mini_cash/domain/coin/provider/bid_ask_provider.dart';
  import 'package:mini_cash/domain/coin/provider/f_chart_provider.dart';
  import 'package:mini_cash/domain/coin/repository/ticker_repository.dart';
  import 'package:mini_cash/domain/favorites/data/source/favorites_api.dart';
  import 'package:mini_cash/domain/favorites/presentation/state/favorite_state.dart';
  import 'package:mini_cash/entity/coin_entity.dart';

  class CoinScreen extends ConsumerStatefulWidget {
    final CoinEntity coin; // передаємо весь об'єкт CoinEntity
    const CoinScreen({super.key, required this.coin});

    @override
    ConsumerState<CoinScreen> createState() => _CoinScreenState();
  }

  class _CoinScreenState extends ConsumerState<CoinScreen> {
    @override
    void initState() {
      super.initState();
      // Тут можна ініціалізувати стріми, наприклад tickerStreamProvider
      // ref.read(tickerStreamProvider(widget.coin.symbol).notifier).init(widget.coin.symbol);
    }

    @override
    Widget build(BuildContext context) {
      final coin = widget.coin;
      final symbol = coin.symbol;
      final baseAsset = coin.baseAsset;

      ref.watch(tickerStreamProvider(symbol).notifier);
      ref.watch(bidAskCounterProvider);
      ref.watch(counterProvider);
      print(ref.read(favoriteProvider).value);
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(symbol),
            actions: [
              ref
                  .watch(favoriteProvider)
                  .when(
                    data: (favorites) {
                      final fifi = favorites.any((c) => c.symbol == symbol);
                      print(favorites);
                      return IconButton(
                        icon: Icon(
                          fifi ? Icons.favorite : Icons.favorite_border,
                          color: fifi ? Colors.red : null,
                        ),
                        onPressed: () async {
                          final favoriteApi = ref.read(favoritesApiProvider);
                          try {
                            if (fifi) {
                              await favoriteApi.removeFavorite(coin);
                            } else {
                              await favoriteApi.addFavorite(coin);
                            }
                            ref.invalidate(favoriteProvider);
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Error: $e')),
                              );
                            }
                          }
                        },
                      );
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, _) => IconButton(
                      icon: const Icon(Icons.error),
                      onPressed: null,
                    ),
                  ),
            ],
            bottom:  TabBar(
              tabs: [
                Tab(text: 'Price', ),// тут текст занадто малий
                Tab(text: 'Information'),// тут текст занадто малий
                Tab(text: 'Trade data'),// тут текст занадто малий
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CoinPricePresentation(symbol: symbol),
              CoinInfoPresentation(symbol: baseAsset),
              CoinTradedataPresentation(symbol: symbol),
            ],
          ),
        ),
      );
    }
  }
