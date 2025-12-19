// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignUpResponse {

 String get uid; String get email; String? get name; bool get isLoggedIn; DateTime? get createdAt;
/// Create a copy of SignUpResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpResponseCopyWith<SignUpResponse> get copyWith => _$SignUpResponseCopyWithImpl<SignUpResponse>(this as SignUpResponse, _$identity);

  /// Serializes this SignUpResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpResponse&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,email,name,isLoggedIn,createdAt);

@override
String toString() {
  return 'SignUpResponse(uid: $uid, email: $email, name: $name, isLoggedIn: $isLoggedIn, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SignUpResponseCopyWith<$Res>  {
  factory $SignUpResponseCopyWith(SignUpResponse value, $Res Function(SignUpResponse) _then) = _$SignUpResponseCopyWithImpl;
@useResult
$Res call({
 String uid, String email, String? name, bool isLoggedIn, DateTime? createdAt
});




}
/// @nodoc
class _$SignUpResponseCopyWithImpl<$Res>
    implements $SignUpResponseCopyWith<$Res> {
  _$SignUpResponseCopyWithImpl(this._self, this._then);

  final SignUpResponse _self;
  final $Res Function(SignUpResponse) _then;

/// Create a copy of SignUpResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? email = null,Object? name = freezed,Object? isLoggedIn = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SignUpResponse].
extension SignUpResponsePatterns on SignUpResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignUpResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignUpResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignUpResponse value)  $default,){
final _that = this;
switch (_that) {
case _SignUpResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignUpResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SignUpResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String email,  String? name,  bool isLoggedIn,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignUpResponse() when $default != null:
return $default(_that.uid,_that.email,_that.name,_that.isLoggedIn,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String email,  String? name,  bool isLoggedIn,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _SignUpResponse():
return $default(_that.uid,_that.email,_that.name,_that.isLoggedIn,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String email,  String? name,  bool isLoggedIn,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SignUpResponse() when $default != null:
return $default(_that.uid,_that.email,_that.name,_that.isLoggedIn,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SignUpResponse implements SignUpResponse {
  const _SignUpResponse({required this.uid, required this.email, this.name, required this.isLoggedIn, this.createdAt});
  factory _SignUpResponse.fromJson(Map<String, dynamic> json) => _$SignUpResponseFromJson(json);

@override final  String uid;
@override final  String email;
@override final  String? name;
@override final  bool isLoggedIn;
@override final  DateTime? createdAt;

/// Create a copy of SignUpResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpResponseCopyWith<_SignUpResponse> get copyWith => __$SignUpResponseCopyWithImpl<_SignUpResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignUpResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpResponse&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,email,name,isLoggedIn,createdAt);

@override
String toString() {
  return 'SignUpResponse(uid: $uid, email: $email, name: $name, isLoggedIn: $isLoggedIn, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SignUpResponseCopyWith<$Res> implements $SignUpResponseCopyWith<$Res> {
  factory _$SignUpResponseCopyWith(_SignUpResponse value, $Res Function(_SignUpResponse) _then) = __$SignUpResponseCopyWithImpl;
@override @useResult
$Res call({
 String uid, String email, String? name, bool isLoggedIn, DateTime? createdAt
});




}
/// @nodoc
class __$SignUpResponseCopyWithImpl<$Res>
    implements _$SignUpResponseCopyWith<$Res> {
  __$SignUpResponseCopyWithImpl(this._self, this._then);

  final _SignUpResponse _self;
  final $Res Function(_SignUpResponse) _then;

/// Create a copy of SignUpResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? email = null,Object? name = freezed,Object? isLoggedIn = null,Object? createdAt = freezed,}) {
  return _then(_SignUpResponse(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
