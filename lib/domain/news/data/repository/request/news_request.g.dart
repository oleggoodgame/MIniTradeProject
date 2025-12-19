// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsRequest _$NewsRequestFromJson(Map<String, dynamic> json) => _NewsRequest(
  limit: (json['limit'] as num).toInt(),
  sort: json['sort'] as String,
  order: json['order'] as String,
);

Map<String, dynamic> _$NewsRequestToJson(_NewsRequest instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'sort': instance.sort,
      'order': instance.order,
    };
