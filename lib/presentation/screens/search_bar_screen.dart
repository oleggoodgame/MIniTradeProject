import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/domain/search/presentation/coin_search_bar.dart';
import 'package:mini_cash/domain/search/repository/search_repository.dart';

class SearchBarScreen extends ConsumerStatefulWidget {
  const SearchBarScreen({super.key});

  @override
  ConsumerState<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends ConsumerState<SearchBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reload coins( Take new coins)"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(coinsRepositoryProvider).syncCoins();
            },
          ),
        ],
      ),
      body: CoinSearchBar(),
    );
  }
}
