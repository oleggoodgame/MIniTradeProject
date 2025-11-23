import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/domain/log_in/data/repository/request/log_in_request.dart';
import 'package:mini_cash/domain/log_in/data/repository/response/log_in_response.dart';
import 'package:mini_cash/domain/log_in/data/sources/log_in_api.dart';
import 'package:mini_cash/domain/log_in/repository/ilog_in_repository.dart';

final logInRepositoryProvider = Provider.autoDispose<IlogInRepository>((ref) {
  final signUpApi = ref.watch(logInApiProvider);

  return LogInRepository(signUpApi);
});

class LogInRepository implements IlogInRepository {
  final LogInApi _logInApi;

  LogInRepository(this._logInApi);

  @override
  Future<LogInResponse> log_in(LogInRequest data) async {
    return await _logInApi.log_in(data);
  }
}
