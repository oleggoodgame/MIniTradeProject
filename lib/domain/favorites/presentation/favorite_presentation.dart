import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/domain/favorites/presentation/state/favorite_state.dart';
import 'package:mini_cash/entity/coin_entity.dart';

class FavoritePresentation extends ConsumerWidget {
  const FavoritePresentation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoriteProvider);

    return favoritesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (favorites) {
        if (favorites.isEmpty) {
          return const Center(
            child: Text('No favorites yet ❤️', style: TextStyle(fontSize: 16)),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: favorites.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final coin = favorites[index];
            return FavoriteCoinTile(coin: coin);
          },
        );
      },
    );
  }
}

class FavoriteCoinTile extends StatelessWidget {
  final CoinEntity coin;

  const FavoriteCoinTile({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.grey.shade200,
            child: Text(
              coin.symbol.substring(0, 1),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coin.symbol,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  coin.symbol,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          const Icon(Icons.favorite, color: Colors.red),
        ],
      ),
    );
  }
}
