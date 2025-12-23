import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_cash/data/style/widgets/favorite_widget.dart';
import 'package:mini_cash/domain/favorites/presentation/state/favorite_state.dart';

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
            return InkWell(
              onTap: () {
                context.pushNamed('coin', extra: coin);
              },
              child: FavoriteCoinWidget(coin: coin),
            );
          },
        );
      },
    );
  }
}


