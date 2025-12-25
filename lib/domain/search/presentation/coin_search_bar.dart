import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_cash/data/database/firebase_database.dart';
import 'package:mini_cash/data/database/theme_database.dart';
import 'package:mini_cash/data/style/style.dart';
import 'package:mini_cash/domain/list_trade/provider/user_coin_provider.dart';
import 'package:mini_cash/domain/search/provider/coin_search_provider.dart';
import 'package:mini_cash/websocket/binance_prices_websokcet.dart';

class CoinSearchBar extends ConsumerStatefulWidget {
  const CoinSearchBar({Key? key}) : super(key: key);

  @override
  ConsumerState<CoinSearchBar> createState() => _CoinSearchBarState();
}

class _CoinSearchBarState extends ConsumerState<CoinSearchBar> {
  late final FocusNode focusNode;
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    controller = TextEditingController();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final search = controller.text;

    final results = ref.watch(coinSearchProvider(search));
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: ref.watch(themeControllerProvider) == AppThemeMode.dark
                ? Colors.grey[900]
                : Colors.grey[100],
          ),
        ),
        Positioned(
          top: 50,
          left: 16,
          right: 16,
          child: Column(
            children: [
              TextField(
                focusNode: focusNode,
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Search coin…',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ],
          ),
        ),

        if (focusNode.hasFocus && search.isNotEmpty)
          Positioned(
            top: 110,
            left: 16,
            right: 16,
            bottom: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kMedium),
              child: Material(
                elevation: 4,
                child: results.when(
                  loading: () => Center(child: CircularProgressIndicator()),
                  error: (e, _) => Center(child: Text('Error')),
                  data: (coins) => ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: coins.length,
                    itemBuilder: (context, i) {
                      final coin = coins[i];
                      return ListTile(
                        title: Text(
                          coin.baseAsset,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          "Coin: ${coin.symbol}, Price: ${coin.price}",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        onTap: () async {
                          final selectedCoin = coin;

                          FocusScope.of(context).unfocus();

                          await ref
                              .read(firebaseDatabaseProvider)
                              .updateProfileCoint(selectedCoin);
                          await ref.read(pricesProvider.notifier).init([
                            selectedCoin.symbol,
                          ]);
                          ref.invalidate(userCoinsProvider);
                          ref.invalidate(pricesProvider);

                          if (!mounted) return;

                          context.go('/list_trade');
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
