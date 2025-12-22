// account_provider.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:mini_cash/data/database/firebase_database.dart';
import 'package:mini_cash/entity/account_entity.dart';

final accountProvider = StateNotifierProvider<AccountNotifier, Account?>((ref) {
  return AccountNotifier(ref);
});

class RouterRefreshNotifier extends ChangeNotifier {
  void refresh() {
    notifyListeners();
  }
}

final routerRefreshProvider = Provider((ref) {
  return RouterRefreshNotifier();
});

class AccountNotifier extends StateNotifier<Account?> {
  final Ref ref;

  AccountNotifier(this.ref) : super(null);
  Future<void> init() async {
    final user = FirebaseAuth.instance.currentUser;
    print("INNNNNNNNNNNNIT");
    if (user != null) {
      final account = await ref
          .read(firebaseDatabaseProvider)
          .getProfile(user.uid);
      setAccount(account);
    }
  }

  void setAccount(Account? account) {
    state = account;
    ref.read(routerRefreshProvider).refresh();
  }

  Future<void> refreshAccount() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final account = await ref
        .read(firebaseDatabaseProvider)
        .getProfile(user.uid);

    setAccount(account);
  }

  void clear() {
    state = null;
    ref.read(routerRefreshProvider).refresh();
  }
}
