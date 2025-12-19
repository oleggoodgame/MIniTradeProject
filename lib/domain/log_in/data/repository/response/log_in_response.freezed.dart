// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_in_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
LogInResponse _$LogInResponseFromJson(
  Map<String, dynamic> json
) {
    return _$LogInRepsonse.fromJson(
      json
    );
}

/// @nodoc
mixin _$LogInResponse {

 String get uid; String get email; String? get name; bool get isLoggedIn;
/// Create a copy of LogInResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogInResponseCopyWith<LogInResponse> get copyWith => _$LogInResponseCopyWithImpl<LogInResponse>(this as LogInResponse, _$identity);

  /// Serializes this LogInResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogInResponse&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,email,name,isLoggedIn);

@override
String toString() {
  return 'LogInResponse(uid: $uid, email: $email, name: $name, isLoggedIn: $isLoggedIn)';
}


}

/// @nodoc
abstract mixin class $LogInResponseCopyWith<$Res>  {
  factory $LogInResponseCopyWith(LogInResponse value, $Res Function(LogInResponse) _then) = _$LogInResponseCopyWithImpl;
@useResult
$Res call({
 String uid, String email, String? name, bool isLoggedIn
});




}
/// @nodoc
class _$LogInResponseCopyWithImpl<$Res>
    implements $LogInResponseCopyWith<$Res> {
  _$LogInResponseCopyWithImpl(this._self, this._then);

  final LogInResponse _self;
  final $Res Function(LogInResponse) _then;

/// Create a copy of LogInResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? email = null,Object? name = freezed,Object? isLoggedIn = null,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LogInResponse].
extension LogInResponsePatterns on LogInResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _$LogInRepsonse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _$LogInRepsonse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _$LogInRepsonse value)  $default,){
final _that = this;
switch (_that) {
case _$LogInRepsonse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _$LogInRepsonse value)?  $default,){
final _that = this;
switch (_that) {
case _$LogInRepsonse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String email,  String? name,  bool isLoggedIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _$LogInRepsonse() when $default != null:
return $default(_that.uid,_that.email,_that.name,_that.isLoggedIn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String email,  String? name,  bool isLoggedIn)  $default,) {final _that = this;
switch (_that) {
case _$LogInRepsonse():
return $default(_that.uid,_that.email,_that.name,_that.isLoggedIn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String email,  String? name,  bool isLoggedIn)?  $default,) {final _that = this;
switch (_that) {
case _$LogInRepsonse() when $default != null:
return $default(_that.uid,_that.email,_that.name,_that.isLoggedIn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _$LogInRepsonse implements LogInResponse {
  const _$LogInRepsonse({required this.uid, required this.email, this.name, required this.isLoggedIn});
  factory _$LogInRepsonse.fromJson(Map<String, dynamic> json) => _$$LogInRepsonseFromJson(json);

@override final  String uid;
@override final  String email;
@override final  String? name;
@override final  bool isLoggedIn;

/// Create a copy of LogInResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$$LogInRepsonseCopyWith<_$LogInRepsonse> get copyWith => __$$LogInRepsonseCopyWithImpl<_$LogInRepsonse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$$LogInRepsonseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$LogInRepsonse&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,email,name,isLoggedIn);

@override
String toString() {
  return 'LogInResponse(uid: $uid, email: $email, name: $name, isLoggedIn: $isLoggedIn)';
}


}

/// @nodoc
abstract mixin class _$$LogInRepsonseCopyWith<$Res> implements $LogInResponseCopyWith<$Res> {
  factory _$$LogInRepsonseCopyWith(_$LogInRepsonse value, $Res Function(_$LogInRepsonse) _then) = __$$LogInRepsonseCopyWithImpl;
@override @useResult
$Res call({
 String uid, String email, String? name, bool isLoggedIn
});




}
/// @nodoc
class __$$LogInRepsonseCopyWithImpl<$Res>
    implements _$$LogInRepsonseCopyWith<$Res> {
  __$$LogInRepsonseCopyWithImpl(this._self, this._then);

  final _$LogInRepsonse _self;
  final $Res Function(_$LogInRepsonse) _then;

/// Create a copy of LogInResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? email = null,Object? name = freezed,Object? isLoggedIn = null,}) {
  return _then(_$LogInRepsonse(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
