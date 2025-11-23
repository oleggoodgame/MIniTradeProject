import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/domain/sign_up/data/repository/request/sign_up_request.dart';
import 'package:mini_cash/domain/sign_up/data/repository/response/sign_up_response.dart';
import 'package:mini_cash/domain/sign_up/data/sources/sign_up_api.dart';
import 'package:mini_cash/domain/sign_up/repository/isign_up_repository.dart';

final signUpRepositoryProvider = Provider.autoDispose<ISignUpRepository>((ref) {
  final signUpApi = ref.watch(signUpApiProvider);

  return SignUpRepository(signUpApi);
});

class SignUpRepository implements ISignUpRepository {
  final SignUpApi _signUpApi;

  SignUpRepository(this._signUpApi);

  @override
  Future<SignUpResponse> sign_up(SignUpRequest data) async {
    return await _signUpApi.signUp(data);
  }
}
