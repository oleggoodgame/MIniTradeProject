import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:mini_cash/domain/favorites/repository/favorite_repository.dart';
import 'package:mini_cash/domain/favorites/repository/ifavorite_repository.dart';
import 'package:mini_cash/entity/coin_entity.dart';

final favoriteProvider =
    StateNotifierProvider<FavoriteNotifier, AsyncValue<List<CoinEntity>>>(
  (ref) {
    final repo = ref.watch(favoriteRepositoryProvider);
    return FavoriteNotifier(repo);
  },
);

class FavoriteNotifier extends StateNotifier<AsyncValue<List<CoinEntity>>> {
  final IFavoriteRepository _repository;

  FavoriteNotifier(this._repository) : super(const AsyncLoading()) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    try {
      final favorites = await _repository.getFavorites();
      state = AsyncData(favorites);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> addFavorite(CoinEntity coin) async {
    if (state.value == null) return;

    final updated = [...state.value!, coin];
    state = AsyncData(updated);
  }
}
