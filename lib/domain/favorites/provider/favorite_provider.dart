import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/domain/favorites/data/source/favorites_api.dart';
import 'package:mini_cash/entity/coin_entity.dart';

final favoriteProvider = FutureProvider.autoDispose<List<CoinEntity>>((
  ref,
) async {
  final favoriteApi = ref.watch(favoritesApiProvider);
  return await favoriteApi.getFavorites();
});
