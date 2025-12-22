// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavoriteRequest {

 String get email; String get id;
/// Create a copy of FavoriteRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteRequestCopyWith<FavoriteRequest> get copyWith => _$FavoriteRequestCopyWithImpl<FavoriteRequest>(this as FavoriteRequest, _$identity);

  /// Serializes this FavoriteRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteRequest&&(identical(other.email, email) || other.email == email)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,id);

@override
String toString() {
  return 'FavoriteRequest(email: $email, id: $id)';
}


}

/// @nodoc
abstract mixin class $FavoriteRequestCopyWith<$Res>  {
  factory $FavoriteRequestCopyWith(FavoriteRequest value, $Res Function(FavoriteRequest) _then) = _$FavoriteRequestCopyWithImpl;
@useResult
$Res call({
 String email, String id
});




}
/// @nodoc
class _$FavoriteRequestCopyWithImpl<$Res>
    implements $FavoriteRequestCopyWith<$Res> {
  _$FavoriteRequestCopyWithImpl(this._self, this._then);

  final FavoriteRequest _self;
  final $Res Function(FavoriteRequest) _then;

/// Create a copy of FavoriteRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? id = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FavoriteRequest].
extension FavoriteRequestPatterns on FavoriteRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoriteRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoriteRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoriteRequest value)  $default,){
final _that = this;
switch (_that) {
case _FavoriteRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoriteRequest value)?  $default,){
final _that = this;
switch (_that) {
case _FavoriteRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoriteRequest() when $default != null:
return $default(_that.email,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String id)  $default,) {final _that = this;
switch (_that) {
case _FavoriteRequest():
return $default(_that.email,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String id)?  $default,) {final _that = this;
switch (_that) {
case _FavoriteRequest() when $default != null:
return $default(_that.email,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FavoriteRequest implements FavoriteRequest {
  const _FavoriteRequest({required this.email, required this.id});
  factory _FavoriteRequest.fromJson(Map<String, dynamic> json) => _$FavoriteRequestFromJson(json);

@override final  String email;
@override final  String id;

/// Create a copy of FavoriteRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteRequestCopyWith<_FavoriteRequest> get copyWith => __$FavoriteRequestCopyWithImpl<_FavoriteRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FavoriteRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteRequest&&(identical(other.email, email) || other.email == email)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,id);

@override
String toString() {
  return 'FavoriteRequest(email: $email, id: $id)';
}


}

/// @nodoc
abstract mixin class _$FavoriteRequestCopyWith<$Res> implements $FavoriteRequestCopyWith<$Res> {
  factory _$FavoriteRequestCopyWith(_FavoriteRequest value, $Res Function(_FavoriteRequest) _then) = __$FavoriteRequestCopyWithImpl;
@override @useResult
$Res call({
 String email, String id
});




}
/// @nodoc
class __$FavoriteRequestCopyWithImpl<$Res>
    implements _$FavoriteRequestCopyWith<$Res> {
  __$FavoriteRequestCopyWithImpl(this._self, this._then);

  final _FavoriteRequest _self;
  final $Res Function(_FavoriteRequest) _then;

/// Create a copy of FavoriteRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? id = null,}) {
  return _then(_FavoriteRequest(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
