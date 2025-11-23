// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpResponseImpl _$$SignUpResponseImplFromJson(Map<String, dynamic> json) =>
    _$SignUpResponseImpl(
      uid: json['uid'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      isLoggedIn: json['isLoggedIn'] as bool,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$SignUpResponseImplToJson(
  _$SignUpResponseImpl instance,
) => <String, dynamic>{
  'uid': instance.uid,
  'email': instance.email,
  'name': instance.name,
  'isLoggedIn': instance.isLoggedIn,
  'createdAt': instance.createdAt?.toIso8601String(),
};
