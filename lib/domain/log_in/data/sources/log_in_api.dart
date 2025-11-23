import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/data/database/firebase_database.dart';
import 'package:mini_cash/domain/log_in/data/repository/request/log_in_request.dart';
import 'package:mini_cash/domain/log_in/data/repository/response/log_in_response.dart';
import 'package:mini_cash/domain/log_in/repository/ilog_in_repository.dart';

final logInApiProvider = Provider.autoDispose<LogInApi>((ref) {
  return LogInApi();
});

class LogInApi implements IlogInRepository{
  final _db = DatabaseService();
  Future<LogInResponse> log_in(LogInRequest data) async {
    final userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: data.email,
          password: data.password,
        );

    final uid = userCredential.user!.uid;
    print(uid);
    final response = await _db.getProfile(uid);
    return LogInResponse(
      uid: uid,
      email: response!.email,
      name: response.name,
      isLoggedIn: true,
    );
  }
}
