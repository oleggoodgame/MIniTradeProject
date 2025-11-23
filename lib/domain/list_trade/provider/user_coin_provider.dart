import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/data/database/firebase_database.dart';
import 'package:mini_cash/entity/coin_entity.dart';
import 'package:mini_cash/presentation/providers/account_provider.dart';

final userCoinsProvider = FutureProvider<List<CoinEntity>>((ref) async {
  final coins = await ref.read(firebaseDatabaseProvider).getUserCoins();
  print(coins);
  return List<CoinEntity>.from(coins);
});



