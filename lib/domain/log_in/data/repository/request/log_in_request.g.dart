// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_in_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LogInRequest _$LogInRequestFromJson(Map<String, dynamic> json) =>
    _LogInRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LogInRequestToJson(_LogInRequest instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};
