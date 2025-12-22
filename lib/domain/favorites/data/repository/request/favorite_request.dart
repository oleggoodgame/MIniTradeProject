import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_request.freezed.dart';
part 'favorite_request.g.dart';

@freezed
class FavoriteRequest with _$FavoriteRequest {
  const factory FavoriteRequest({
    required String email,
    required String id,
  }) = _FavoriteRequest;

  factory FavoriteRequest.fromJson(Map<String, dynamic> json) =>
      _$FavoriteRequestFromJson(json);
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
