// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResetPasswordResponse _$ResetPasswordResponseFromJson(
  Map<String, dynamic> json,
) => _ResetPasswordResponse(
  uid: json['uid'] as String,
  email: json['email'] as String,
  isChanged: json['isChanged'] as bool,
);

Map<String, dynamic> _$ResetPasswordResponseToJson(
  _ResetPasswordResponse instance,
) => <String, dynamic>{
  'uid': instance.uid,
  'email': instance.email,
  'isChanged': instance.isChanged,
};
