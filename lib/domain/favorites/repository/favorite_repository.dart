import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/domain/favorites/data/source/favorites_api.dart';
import 'package:mini_cash/domain/favorites/repository/ifavorite_repository.dart';
import 'package:mini_cash/entity/coin_entity.dart';
final favoriteRepositoryProvider = Provider.autoDispose<FavoriteRepository>((ref) {
  final favoritesApi = ref.watch(favoritesApiProvider);

  return FavoriteRepository(favoritesApi);
});
class FavoriteRepository implements IFavoriteRepository {
  final FavoritesApi _favoriteApi;
  FavoriteRepository(this._favoriteApi);
  @override
  Future<List<CoinEntity>> getFavorites() async {
    return await _favoriteApi.getFavorites();
  }

  @override
  Future<void> addFavorite(CoinEntity coin) async {
    return await _favoriteApi.addFavorite(coin);
  }
  
  @override
  Future<void> removeFavorite( CoinEntity coin) async {
    return await _favoriteApi.removeFavorite( coin);
  }
}
