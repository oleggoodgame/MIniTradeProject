  import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_in_response.freezed.dart';
part 'log_in_response.g.dart';

@freezed
class LogInResponse with _$LogInResponse {
  const factory LogInResponse({
    required String uid,
    required String email,
    String? name,
    required bool isLoggedIn,
  }) = _$LogInRepsonse;

  factory LogInResponse.fromJson(Map<String, dynamic> json) =>
      _$LogInResponseFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
