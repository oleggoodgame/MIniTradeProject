import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/domain/reset_password/send_email_reset/repository/isend_email_reset_repository.dart';

final sendResetApiProvider = Provider.autoDispose<ISendEmailResetRepository>(
  (ref) => SendEmailResetApi(FirebaseAuth.instance),
);

class SendEmailResetApi implements ISendEmailResetRepository {
  final FirebaseAuth _auth;

  SendEmailResetApi(this._auth);

  @override
  Future<void> sendResetEmail() async {
    try {
      await _auth.sendPasswordResetEmail(email: _auth.currentUser!.email!);
      await _auth.signOut();
    } on FirebaseAuthException {
      rethrow;
    }
  }
}
