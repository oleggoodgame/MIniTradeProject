import 'package:mini_cash/entity/coin_entity.dart';

abstract class CoinsRepository {
  Future<void> syncCoins();                 
  Future<List<CoinEntity>> searchCoins(String query);
}