import 'package:mini_cash/entity/account_entity.dart';

class LogInState {
  final bool isLoading;
  final bool? isLogInSucces;
  final String? error;
  final Account? user;

  LogInState({
    required this.isLoading,
    required this.isLogInSucces,
    required this.error,
    required this.user,
  });

  factory LogInState.initial() {
    return LogInState(
      isLoading: false,
      isLogInSucces: null,
      error: null,
      user: null,
    );
  }

  LogInState copyWith({
    bool? isLoading,
    bool? isLogInSucces,
    String? error,
    Account? user,
  }) {
    return LogInState(
      isLoading: isLoading ?? this.isLoading,
      isLogInSucces: isLogInSucces ?? this.isLogInSucces,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }
}
