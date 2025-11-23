import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/domain/sign_up/data/repository/request/sign_up_request.dart';
import 'package:mini_cash/domain/sign_up/data/sources/sign_up_api.dart';
import 'package:mini_cash/domain/sign_up/presentation/state/sign_up_state.dart';
import 'package:mini_cash/entity/account_entity.dart';

final signUpControllerProvider =
    NotifierProvider<SignUpController, SignUpState>(SignUpController.new);

class SignUpController extends Notifier<SignUpState> {
  @override
  SignUpState build() => SignUpState.initial();

  Future<void> signUp(SignUpRequest request) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final api = ref.read(signUpApiProvider);
      final response = await api.signUp(request); // SignUpResponse

      // Перетворюємо SignUpResponse в Account
      final account = Account(
        id: response.uid,
        name: response.name!,
        email: response.email,
        isLoggedIn: response.isLoggedIn,
      );

      state = state.copyWith(
        isLoading: false,
        user: account,
        isSignUpSuccess: true,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isSignUpSuccess: false,
        error: e.toString(),
      );
    }
  }
}
