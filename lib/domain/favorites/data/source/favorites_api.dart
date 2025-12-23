import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/data/database/firebase_database.dart';
import 'package:mini_cash/domain/favorites/repository/ifavorite_repository.dart';
import 'package:mini_cash/entity/coin_entity.dart';

final favoritesApiProvider = Provider.autoDispose<FavoritesApi>((ref) {
  return FavoritesApi();
});

class FavoritesApi implements IFavoriteRepository {
  final DatabaseService _databaseService = DatabaseService();
  @override
  Future<List<CoinEntity>> getFavorites() async {
    return await _databaseService.getFavoriteCoins();
  }

  @override
  Future<void> addFavorite(CoinEntity coin) async {
    return await _databaseService.updateFavoritesCoint(coin);
    
  }
  
  @override
  Future<void> removeFavorite(CoinEntity coin) async {
   await _databaseService.removeFavoriteCoint(coin);
   
  }
}
