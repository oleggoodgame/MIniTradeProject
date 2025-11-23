import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/data/database/firebase_database.dart';
import 'package:mini_cash/domain/search/provider/coin_search_provider.dart';

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
      setState(() {}); // оновлює пошук у реальному часі
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
    // print(results.value);
    return Stack(
      children: [
        // Тло (можеш додати фон)
        Positioned.fill(child: Container(color: Colors.grey[100])),

        // Поле пошуку зверху
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

        // Список результатів
        if (focusNode.hasFocus && search.isNotEmpty)
          Positioned(
            top: 110, // рівно під полем
            left: 16,
            right: 16,
            bottom: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Material(
                elevation: 4,
                child: results.when(
                  loading: () => Center(child: CircularProgressIndicator()),
                  error: (e, _) => Center(child: Text('Error')),
                  data: (coins) => ListView.builder(
                    padding: EdgeInsets.zero, // прибираємо внутрішній padding
                    itemCount: coins.length,
                    itemBuilder: (context, i) {
                      final coin = coins[i];
                      return ListTile(
                        title: Text(coin.baseAsset),
                        subtitle: Text(
                          "Coin: ${coin.symbol}, Price: ${coin.price}",
                        ),
                        onTap: () async {
                          controller.text = coin.baseAsset;
                          FocusScope.of(context).unfocus();

                          try {
                            await ref
                                .read(firebaseDatabaseProvider)
                                .updateProfileCoint(coin);
                            if (!mounted) return;
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text("Успішно"),
                                content: Text(
                                  "${coin.baseAsset} додано до списку",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text("Ок"),
                                  ),
                                ],
                              ),
                            );
                          } catch (e) {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text("Успішно"),
                                content: Text(
                                  "${coin.baseAsset} додано до списку",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text("Ок"),
                                  ),
                                ],
                              ),
                            );
                          }
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
