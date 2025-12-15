// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsRequestImpl _$$NewsRequestImplFromJson(Map<String, dynamic> json) =>
    _$NewsRequestImpl(
      limit: (json['limit'] as num).toInt(),
      sort: json['sort'] as String,
      order: json['order'] as String,
    );

Map<String, dynamic> _$$NewsRequestImplToJson(_$NewsRequestImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'sort': instance.sort,
      'order': instance.order,
    };
