// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsRequest {

 int get limit; String get sort; String get order;
/// Create a copy of NewsRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsRequestCopyWith<NewsRequest> get copyWith => _$NewsRequestCopyWithImpl<NewsRequest>(this as NewsRequest, _$identity);

  /// Serializes this NewsRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsRequest&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,sort,order);

@override
String toString() {
  return 'NewsRequest(limit: $limit, sort: $sort, order: $order)';
}


}

/// @nodoc
abstract mixin class $NewsRequestCopyWith<$Res>  {
  factory $NewsRequestCopyWith(NewsRequest value, $Res Function(NewsRequest) _then) = _$NewsRequestCopyWithImpl;
@useResult
$Res call({
 int limit, String sort, String order
});




}
/// @nodoc
class _$NewsRequestCopyWithImpl<$Res>
    implements $NewsRequestCopyWith<$Res> {
  _$NewsRequestCopyWithImpl(this._self, this._then);

  final NewsRequest _self;
  final $Res Function(NewsRequest) _then;

/// Create a copy of NewsRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = null,Object? sort = null,Object? order = null,}) {
  return _then(_self.copyWith(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NewsRequest].
extension NewsRequestPatterns on NewsRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsRequest value)  $default,){
final _that = this;
switch (_that) {
case _NewsRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsRequest value)?  $default,){
final _that = this;
switch (_that) {
case _NewsRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int limit,  String sort,  String order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsRequest() when $default != null:
return $default(_that.limit,_that.sort,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int limit,  String sort,  String order)  $default,) {final _that = this;
switch (_that) {
case _NewsRequest():
return $default(_that.limit,_that.sort,_that.order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int limit,  String sort,  String order)?  $default,) {final _that = this;
switch (_that) {
case _NewsRequest() when $default != null:
return $default(_that.limit,_that.sort,_that.order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewsRequest implements NewsRequest {
  const _NewsRequest({required this.limit, required this.sort, required this.order});
  factory _NewsRequest.fromJson(Map<String, dynamic> json) => _$NewsRequestFromJson(json);

@override final  int limit;
@override final  String sort;
@override final  String order;

/// Create a copy of NewsRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsRequestCopyWith<_NewsRequest> get copyWith => __$NewsRequestCopyWithImpl<_NewsRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewsRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsRequest&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,sort,order);

@override
String toString() {
  return 'NewsRequest(limit: $limit, sort: $sort, order: $order)';
}


}

/// @nodoc
abstract mixin class _$NewsRequestCopyWith<$Res> implements $NewsRequestCopyWith<$Res> {
  factory _$NewsRequestCopyWith(_NewsRequest value, $Res Function(_NewsRequest) _then) = __$NewsRequestCopyWithImpl;
@override @useResult
$Res call({
 int limit, String sort, String order
});




}
/// @nodoc
class __$NewsRequestCopyWithImpl<$Res>
    implements _$NewsRequestCopyWith<$Res> {
  __$NewsRequestCopyWithImpl(this._self, this._then);

  final _NewsRequest _self;
  final $Res Function(_NewsRequest) _then;

/// Create a copy of NewsRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,Object? sort = null,Object? order = null,}) {
  return _then(_NewsRequest(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
