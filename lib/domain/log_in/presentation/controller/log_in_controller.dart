import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/domain/log_in/data/repository/request/log_in_request.dart';
import 'package:mini_cash/domain/log_in/data/sources/log_in_api.dart';
import 'package:mini_cash/domain/log_in/presentation/state/log_in_state.dart';
import 'package:mini_cash/entity/account_entity.dart';

final logInControllerProvider =
    NotifierProvider.autoDispose<LogInController, LogInState>(
      LogInController.new,
    );

class LogInController extends Notifier<LogInState> {
  @override
  LogInState build() => LogInState.initial();

  Future<void> logIn(LogInRequest request) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final api = ref.read(logInApiProvider);
      final response = await api.log_in(request); // LogInResponse
      print("Log in Respone: $response");
      // ✅ Перетворюємо LogInResponse у Account
      final account = Account(
        id: response.uid,
        name: response.name ?? 'Unknown', 
        email: response.email,
        isLoggedIn: response.isLoggedIn,
      );

      print("Log In account: ${account.isLoggedIn}");// це виводить нормально 
      print("Log In account: ${account.email}");// це виводить нормально

      // ✅ Оновлюємо стан
      state = state.copyWith(
        isLoading: false,
        user: account,
        isLogInSucces: true, // потім можна перейменувати у isLogInSuccess
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isLogInSucces: false,
        error: e.toString(),
      );
    }
  }
}
