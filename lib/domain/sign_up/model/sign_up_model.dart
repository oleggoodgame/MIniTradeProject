
class SignUpModel {
  final String email;
  final String name;
  final bool isSignUpSuccess;

  SignUpModel({
    required this.email,
    required this.name,
    required this.isSignUpSuccess,
  });

  SignUpModel copyWith({
    String? email,
    String? name,
    bool? isSignUpSuccess,
  }) {
    return SignUpModel(
      email: email ?? this.email,
      name: name ?? this.name,
      isSignUpSuccess: isSignUpSuccess ?? this.isSignUpSuccess,
    );
  }

  @override
  String toString() {
    return 'SignUpModel(email: $email, name: $name, isSignUpSuccess: $isSignUpSuccess)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignUpModel &&
        other.email == email &&
        other.name == name &&
        other.isSignUpSuccess == isSignUpSuccess;
  }

  @override
  int get hashCode => email.hashCode ^ name.hashCode ^ isSignUpSuccess.hashCode;
}
