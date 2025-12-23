import 'package:mini_cash/entity/coin_entity.dart';

abstract class IFavoriteRepository {
  Future<List<CoinEntity>> getFavorites();
  Future<void> addFavorite(CoinEntity coin);
  Future<void> removeFavorite(CoinEntity coin);
}