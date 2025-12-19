// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_in_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogInRepsonse _$$LogInRepsonseFromJson(Map<String, dynamic> json) =>
    _$LogInRepsonse(
      uid: json['uid'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      isLoggedIn: json['isLoggedIn'] as bool,
    );

Map<String, dynamic> _$$LogInRepsonseToJson(_$LogInRepsonse instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'name': instance.name,
      'isLoggedIn': instance.isLoggedIn,
    };
