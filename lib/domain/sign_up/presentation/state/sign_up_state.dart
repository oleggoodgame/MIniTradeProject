
import 'package:mini_cash/entity/account_entity.dart';

class SignUpState {
  final bool isLoading;
  final bool? isSignUpSuccess;
  final String? error;
  final Account? user;

  SignUpState({
    required this.isLoading,
    required this.isSignUpSuccess,
    required this.error,
    required this.user,
  });

  factory SignUpState.initial() {
    return SignUpState(
      isLoading: false,
      isSignUpSuccess: null,
      error: null,
      user: null,
    );
  }

  SignUpState copyWith({
    bool? isLoading,
    bool? isSignUpSuccess,
    String? error,
    Account? user,
  }) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
      isSignUpSuccess: isSignUpSuccess ?? this.isSignUpSuccess,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }
}
