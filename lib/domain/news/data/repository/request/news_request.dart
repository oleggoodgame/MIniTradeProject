import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_request.freezed.dart';
part 'news_request.g.dart';

@freezed
class NewsRequest with _$NewsRequest {
  const factory NewsRequest({
    required int limit,
    required String sort,
    required String order,
  }) = _NewsRequest;

  factory NewsRequest.fromJson(Map<String, dynamic> json) =>
      _$NewsRequestFromJson(json);
}
