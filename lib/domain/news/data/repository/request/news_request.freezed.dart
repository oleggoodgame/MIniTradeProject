// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NewsRequest _$NewsRequestFromJson(Map<String, dynamic> json) {
  return _NewsRequest.fromJson(json);
}

/// @nodoc
mixin _$NewsRequest {
  int get limit => throw _privateConstructorUsedError;
  String get sort => throw _privateConstructorUsedError;
  String get order => throw _privateConstructorUsedError;

  /// Serializes this NewsRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsRequestCopyWith<NewsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsRequestCopyWith<$Res> {
  factory $NewsRequestCopyWith(
    NewsRequest value,
    $Res Function(NewsRequest) then,
  ) = _$NewsRequestCopyWithImpl<$Res, NewsRequest>;
  @useResult
  $Res call({int limit, String sort, String order});
}

/// @nodoc
class _$NewsRequestCopyWithImpl<$Res, $Val extends NewsRequest>
    implements $NewsRequestCopyWith<$Res> {
  _$NewsRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? limit = null, Object? sort = null, Object? order = null}) {
    return _then(
      _value.copyWith(
            limit: null == limit
                ? _value.limit
                : limit // ignore: cast_nullable_to_non_nullable
                      as int,
            sort: null == sort
                ? _value.sort
                : sort // ignore: cast_nullable_to_non_nullable
                      as String,
            order: null == order
                ? _value.order
                : order // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NewsRequestImplCopyWith<$Res>
    implements $NewsRequestCopyWith<$Res> {
  factory _$$NewsRequestImplCopyWith(
    _$NewsRequestImpl value,
    $Res Function(_$NewsRequestImpl) then,
  ) = __$$NewsRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int limit, String sort, String order});
}

/// @nodoc
class __$$NewsRequestImplCopyWithImpl<$Res>
    extends _$NewsRequestCopyWithImpl<$Res, _$NewsRequestImpl>
    implements _$$NewsRequestImplCopyWith<$Res> {
  __$$NewsRequestImplCopyWithImpl(
    _$NewsRequestImpl _value,
    $Res Function(_$NewsRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NewsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? limit = null, Object? sort = null, Object? order = null}) {
    return _then(
      _$NewsRequestImpl(
        limit: null == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
        sort: null == sort
            ? _value.sort
            : sort // ignore: cast_nullable_to_non_nullable
                  as String,
        order: null == order
            ? _value.order
            : order // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsRequestImpl implements _NewsRequest {
  const _$NewsRequestImpl({
    required this.limit,
    required this.sort,
    required this.order,
  });

  factory _$NewsRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsRequestImplFromJson(json);

  @override
  final int limit;
  @override
  final String sort;
  @override
  final String order;

  @override
  String toString() {
    return 'NewsRequest(limit: $limit, sort: $sort, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsRequestImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, limit, sort, order);

  /// Create a copy of NewsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsRequestImplCopyWith<_$NewsRequestImpl> get copyWith =>
      __$$NewsRequestImplCopyWithImpl<_$NewsRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsRequestImplToJson(this);
  }
}

abstract class _NewsRequest implements NewsRequest {
  const factory _NewsRequest({
    required final int limit,
    required final String sort,
    required final String order,
  }) = _$NewsRequestImpl;

  factory _NewsRequest.fromJson(Map<String, dynamic> json) =
      _$NewsRequestImpl.fromJson;

  @override
  int get limit;
  @override
  String get sort;
  @override
  String get order;

  /// Create a copy of NewsRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsRequestImplCopyWith<_$NewsRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
