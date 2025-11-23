// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_in_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$LogInRepsonseImpl _$$$LogInRepsonseImplFromJson(Map<String, dynamic> json) =>
    _$$LogInRepsonseImpl(
      uid: json['uid'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      isLoggedIn: json['isLoggedIn'] as bool,
    );

Map<String, dynamic> _$$$LogInRepsonseImplToJson(
  _$$LogInRepsonseImpl instance,
) => <String, dynamic>{
  'uid': instance.uid,
  'email': instance.email,
  'name': instance.name,
  'isLoggedIn': instance.isLoggedIn,
};
