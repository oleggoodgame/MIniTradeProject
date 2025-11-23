// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_in_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LogInResponse _$LogInResponseFromJson(Map<String, dynamic> json) {
  return _$LogInRepsonse.fromJson(json);
}

/// @nodoc
mixin _$LogInResponse {
  String get uid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool get isLoggedIn => throw _privateConstructorUsedError;

  /// Serializes this LogInResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LogInResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LogInResponseCopyWith<LogInResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogInResponseCopyWith<$Res> {
  factory $LogInResponseCopyWith(
    LogInResponse value,
    $Res Function(LogInResponse) then,
  ) = _$LogInResponseCopyWithImpl<$Res, LogInResponse>;
  @useResult
  $Res call({String uid, String email, String? name, bool isLoggedIn});
}

/// @nodoc
class _$LogInResponseCopyWithImpl<$Res, $Val extends LogInResponse>
    implements $LogInResponseCopyWith<$Res> {
  _$LogInResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LogInResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? name = freezed,
    Object? isLoggedIn = null,
  }) {
    return _then(
      _value.copyWith(
            uid: null == uid
                ? _value.uid
                : uid // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            isLoggedIn: null == isLoggedIn
                ? _value.isLoggedIn
                : isLoggedIn // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$$LogInRepsonseImplCopyWith<$Res>
    implements $LogInResponseCopyWith<$Res> {
  factory _$$$LogInRepsonseImplCopyWith(
    _$$LogInRepsonseImpl value,
    $Res Function(_$$LogInRepsonseImpl) then,
  ) = __$$$LogInRepsonseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String email, String? name, bool isLoggedIn});
}

/// @nodoc
class __$$$LogInRepsonseImplCopyWithImpl<$Res>
    extends _$LogInResponseCopyWithImpl<$Res, _$$LogInRepsonseImpl>
    implements _$$$LogInRepsonseImplCopyWith<$Res> {
  __$$$LogInRepsonseImplCopyWithImpl(
    _$$LogInRepsonseImpl _value,
    $Res Function(_$$LogInRepsonseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LogInResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? name = freezed,
    Object? isLoggedIn = null,
  }) {
    return _then(
      _$$LogInRepsonseImpl(
        uid: null == uid
            ? _value.uid
            : uid // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        isLoggedIn: null == isLoggedIn
            ? _value.isLoggedIn
            : isLoggedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$$LogInRepsonseImpl implements _$LogInRepsonse {
  const _$$LogInRepsonseImpl({
    required this.uid,
    required this.email,
    this.name,
    required this.isLoggedIn,
  });

  factory _$$LogInRepsonseImpl.fromJson(Map<String, dynamic> json) =>
      _$$$LogInRepsonseImplFromJson(json);

  @override
  final String uid;
  @override
  final String email;
  @override
  final String? name;
  @override
  final bool isLoggedIn;

  @override
  String toString() {
    return 'LogInResponse(uid: $uid, email: $email, name: $name, isLoggedIn: $isLoggedIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$LogInRepsonseImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uid, email, name, isLoggedIn);

  /// Create a copy of LogInResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$$LogInRepsonseImplCopyWith<_$$LogInRepsonseImpl> get copyWith =>
      __$$$LogInRepsonseImplCopyWithImpl<_$$LogInRepsonseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$$LogInRepsonseImplToJson(this);
  }
}

abstract class _$LogInRepsonse implements LogInResponse {
  const factory _$LogInRepsonse({
    required final String uid,
    required final String email,
    final String? name,
    required final bool isLoggedIn,
  }) = _$$LogInRepsonseImpl;

  factory _$LogInRepsonse.fromJson(Map<String, dynamic> json) =
      _$$LogInRepsonseImpl.fromJson;

  @override
  String get uid;
  @override
  String get email;
  @override
  String? get name;
  @override
  bool get isLoggedIn;

  /// Create a copy of LogInResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$$LogInRepsonseImplCopyWith<_$$LogInRepsonseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
