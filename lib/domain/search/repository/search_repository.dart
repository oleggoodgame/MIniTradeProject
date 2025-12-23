import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/domain/search/data/databaselocal_data.dart';
import 'package:mini_cash/domain/search/data/databaseremote_data.dart';
import 'package:mini_cash/domain/search/repository/isearch_repository.dart';
import 'package:mini_cash/entity/coin_entity.dart';

final coinsRepositoryProvider = Provider<CoinsRepository>((ref) {
  return CoinsRepositoryImpl(
    local: CoinsLocalDataSource(),
    remote: CoinsRemoteDataSource(),
  );
});

class CoinsRepositoryImpl implements CoinsRepository {
  final CoinsLocalDataSource local;
  final CoinsRemoteDataSource remote;

  CoinsRepositoryImpl({required this.local, required this.remote});

  @override
  Future<void> syncCoins() async {
    final coins = await remote.loadCoins();
    await local.replaceAll(coins);
  }

  @override
  Future<List<CoinEntity>> searchCoins(String query) async {
    final result = await local.searchBase(query);
    print(result.isEmpty);
    return result.map((e) => CoinEntity(
      symbol: e['symbol'],
      baseAsset: e['baseAsset'],
      quoteAsset: e['quoteAsset'],
    )).toList();
  }
}

