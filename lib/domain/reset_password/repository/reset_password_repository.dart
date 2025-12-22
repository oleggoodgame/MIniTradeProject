import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/domain/reset_password/data/repository/request/reset_password_request.dart';
import 'package:mini_cash/domain/reset_password/data/repository/response/reset_password_response.dart';
import 'package:mini_cash/domain/reset_password/data/source/reset_password_api.dart';
import 'package:mini_cash/domain/reset_password/repository/ireset_password_repository.dart';

final resetPasswordRepositoryProvider = Provider.autoDispose<IResetPasswordRepository>((ref) {
  final resetPasswordApi = ref.watch(resetPasswordApiProvider);

  return ResetPasswordRepository(resetPasswordApi);
});

class ResetPasswordRepository implements IResetPasswordRepository {
  final IResetPasswordRepository _resetPasswordApi;
  ResetPasswordRepository(this._resetPasswordApi);

  @override
  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest data) async {
    return await _resetPasswordApi.resetPassword(data);
  }
}
