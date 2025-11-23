import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/entity/account_entity.dart';
import 'package:mini_cash/entity/coin_entity.dart';

final Provider firebaseDatabaseProvider = Provider<DatabaseService>((ref) {
  return DatabaseService();
});

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  User? get user => FirebaseAuth.instance.currentUser;

  Future<void> createProfile(String uid, Account account) async {
    await _db.collection("users").doc(uid).set({
      'id': uid,
      'name': account.name,
      'email': account.email,
      'isLoggedIn': account.isLoggedIn,
    });
  }

  Future<Account?> getProfile(String uid) async {
    final doc = await _db.collection("users").doc(uid).get();
    if (doc.exists) {
      final data = doc.data()!;
      return Account(
        id: uid,
        name: data['name'] ?? 'Unknown',
        isLoggedIn: data['isLoggedIn'] ?? false,
        email: data['email'] ?? '',
      );
    } else {
      return null;
    }
  }

  Future<void> updateProfileCoint(CoinEntity coin) async {
    await _db.collection("users").doc(user!.uid).set({
      'coins': FieldValue.arrayUnion([coin.toMap()]),
    }, SetOptions(merge: true));
  }

  Future<List<CoinEntity>> getUserCoins() async {
    final doc = await _db.collection("users").doc(user!.uid).get();
    final coins = doc.data()?['coins'] as List<dynamic>? ?? [];

    return coins.map((coin) {
      return CoinEntity.fromMap(coin as Map<String, dynamic>);
    }).toList();
  }
}
