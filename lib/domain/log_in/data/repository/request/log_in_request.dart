import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_in_request.freezed.dart';
part 'log_in_request.g.dart';

@freezed
class LogInRequest with _$LogInRequest {
  const factory LogInRequest({
    required String email,
    required String password,
  }) = _LogInRequest;

  factory LogInRequest.fromJson(Map<String, dynamic> json) =>
      _$LogInRequestFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
