import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/data/database/firebase_database.dart';
import 'package:mini_cash/entity/coin_entity.dart';

final userCoinsProvider = FutureProvider<List<CoinEntity>>((ref) async {
  final coins = await ref.read(firebaseDatabaseProvider).getUserCoins();
  print(coins);
  return List<CoinEntity>.from(coins);
});



