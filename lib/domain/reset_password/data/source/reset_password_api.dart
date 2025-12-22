import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;
import 'package:mini_cash/domain/reset_password/data/repository/request/reset_password_request.dart';
import 'package:mini_cash/domain/reset_password/data/repository/response/reset_password_response.dart';
import 'package:mini_cash/domain/reset_password/repository/ireset_password_repository.dart';

final resetPasswordApiProvider = Provider.autoDispose<IResetPasswordRepository>(
  (ref) => ResetPasswordApi(FirebaseAuth.instance),
);

class ResetPasswordApi implements IResetPasswordRepository {
  final FirebaseAuth _auth;

  ResetPasswordApi(this._auth);

  @override
  Future<ResetPasswordResponse> resetPassword(
    ResetPasswordRequest request,
  ) async {
    final user = _auth.currentUser;

    if (user == null) {
      throw FirebaseAuthException(
        code: 'user-not-logged-in',
        message: 'User not authenticated',
      );
    }

    try {
      final credential = EmailAuthProvider.credential(
        email: request.email,
        password: request.oldPassword,
      );

      await user.reauthenticateWithCredential(credential);

      await user.updatePassword(request.newPassword);

      return ResetPasswordResponse(
        uid: user.uid,
        email: user.email ?? request.email,
        isChanged: true,
      );
    } on FirebaseAuthException {
      rethrow;
    }
  }
}
