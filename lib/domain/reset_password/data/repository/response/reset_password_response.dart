import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_response.freezed.dart';
part 'reset_password_response.g.dart';

@freezed
class ResetPasswordResponse with _$ResetPasswordResponse {
  const factory ResetPasswordResponse({
    required String uid,
    required String email,
    required bool isChanged,
  }) = _ResetPasswordResponse;

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

