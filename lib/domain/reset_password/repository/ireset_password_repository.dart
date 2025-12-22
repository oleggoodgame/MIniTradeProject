import 'package:mini_cash/domain/reset_password/data/repository/request/reset_password_request.dart';
import 'package:mini_cash/domain/reset_password/data/repository/response/reset_password_response.dart';

abstract class IResetPasswordRepository {
  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest request);
}