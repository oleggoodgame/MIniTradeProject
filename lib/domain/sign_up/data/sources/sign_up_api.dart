import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/data/database/firebase_database.dart';
import 'package:mini_cash/domain/sign_up/data/repository/request/sign_up_request.dart';
import 'package:mini_cash/domain/sign_up/data/repository/response/sign_up_response.dart';
import 'package:mini_cash/entity/account_entity.dart';

final signUpApiProvider = Provider.autoDispose<SignUpApi>((ref) {
  return SignUpApi();
});

class SignUpApi {
  final _db = DatabaseService();
  Future<SignUpResponse> signUp(SignUpRequest data) async {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: data.email,
          password: data.password,
        );

    final uid = userCredential.user!.uid;
    await _db.createProfile(
      uid,
      Account(name: data.name!, email: data.email, id: uid, isLoggedIn: true),
    );
    return SignUpResponse(
      uid: uid,
      email: data.email,
      name: data.name!,
      isLoggedIn: true,
    );
  }
}
