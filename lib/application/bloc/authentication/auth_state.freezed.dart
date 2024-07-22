// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthBlocState {
  AuthMethod get authMethod => throw _privateConstructorUsedError;
  String? get enteredPin => throw _privateConstructorUsedError;
  bool get isAuthenticated => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isExistingUser => throw _privateConstructorUsedError;
  bool get areBiometricsAvailable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthBlocStateCopyWith<AuthBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthBlocStateCopyWith<$Res> {
  factory $AuthBlocStateCopyWith(
          AuthBlocState value, $Res Function(AuthBlocState) then) =
      _$AuthBlocStateCopyWithImpl<$Res, AuthBlocState>;
  @useResult
  $Res call(
      {AuthMethod authMethod,
      String? enteredPin,
      bool isAuthenticated,
      bool isLoading,
      bool isExistingUser,
      bool areBiometricsAvailable});
}

/// @nodoc
class _$AuthBlocStateCopyWithImpl<$Res, $Val extends AuthBlocState>
    implements $AuthBlocStateCopyWith<$Res> {
  _$AuthBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authMethod = null,
    Object? enteredPin = freezed,
    Object? isAuthenticated = null,
    Object? isLoading = null,
    Object? isExistingUser = null,
    Object? areBiometricsAvailable = null,
  }) {
    return _then(_value.copyWith(
      authMethod: null == authMethod
          ? _value.authMethod
          : authMethod // ignore: cast_nullable_to_non_nullable
              as AuthMethod,
      enteredPin: freezed == enteredPin
          ? _value.enteredPin
          : enteredPin // ignore: cast_nullable_to_non_nullable
              as String?,
      isAuthenticated: null == isAuthenticated
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isExistingUser: null == isExistingUser
          ? _value.isExistingUser
          : isExistingUser // ignore: cast_nullable_to_non_nullable
              as bool,
      areBiometricsAvailable: null == areBiometricsAvailable
          ? _value.areBiometricsAvailable
          : areBiometricsAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthBlocStateImplCopyWith<$Res>
    implements $AuthBlocStateCopyWith<$Res> {
  factory _$$AuthBlocStateImplCopyWith(
          _$AuthBlocStateImpl value, $Res Function(_$AuthBlocStateImpl) then) =
      __$$AuthBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthMethod authMethod,
      String? enteredPin,
      bool isAuthenticated,
      bool isLoading,
      bool isExistingUser,
      bool areBiometricsAvailable});
}

/// @nodoc
class __$$AuthBlocStateImplCopyWithImpl<$Res>
    extends _$AuthBlocStateCopyWithImpl<$Res, _$AuthBlocStateImpl>
    implements _$$AuthBlocStateImplCopyWith<$Res> {
  __$$AuthBlocStateImplCopyWithImpl(
      _$AuthBlocStateImpl _value, $Res Function(_$AuthBlocStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authMethod = null,
    Object? enteredPin = freezed,
    Object? isAuthenticated = null,
    Object? isLoading = null,
    Object? isExistingUser = null,
    Object? areBiometricsAvailable = null,
  }) {
    return _then(_$AuthBlocStateImpl(
      authMethod: null == authMethod
          ? _value.authMethod
          : authMethod // ignore: cast_nullable_to_non_nullable
              as AuthMethod,
      enteredPin: freezed == enteredPin
          ? _value.enteredPin
          : enteredPin // ignore: cast_nullable_to_non_nullable
              as String?,
      isAuthenticated: null == isAuthenticated
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isExistingUser: null == isExistingUser
          ? _value.isExistingUser
          : isExistingUser // ignore: cast_nullable_to_non_nullable
              as bool,
      areBiometricsAvailable: null == areBiometricsAvailable
          ? _value.areBiometricsAvailable
          : areBiometricsAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuthBlocStateImpl implements _AuthBlocState {
  _$AuthBlocStateImpl(
      {this.authMethod = AuthMethod.pin,
      this.enteredPin = null,
      this.isAuthenticated = false,
      this.isLoading = false,
      this.isExistingUser = false,
      this.areBiometricsAvailable = false});

  @override
  @JsonKey()
  final AuthMethod authMethod;
  @override
  @JsonKey()
  final String? enteredPin;
  @override
  @JsonKey()
  final bool isAuthenticated;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isExistingUser;
  @override
  @JsonKey()
  final bool areBiometricsAvailable;

  @override
  String toString() {
    return 'AuthBlocState(authMethod: $authMethod, enteredPin: $enteredPin, isAuthenticated: $isAuthenticated, isLoading: $isLoading, isExistingUser: $isExistingUser, areBiometricsAvailable: $areBiometricsAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthBlocStateImpl &&
            (identical(other.authMethod, authMethod) ||
                other.authMethod == authMethod) &&
            (identical(other.enteredPin, enteredPin) ||
                other.enteredPin == enteredPin) &&
            (identical(other.isAuthenticated, isAuthenticated) ||
                other.isAuthenticated == isAuthenticated) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isExistingUser, isExistingUser) ||
                other.isExistingUser == isExistingUser) &&
            (identical(other.areBiometricsAvailable, areBiometricsAvailable) ||
                other.areBiometricsAvailable == areBiometricsAvailable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authMethod, enteredPin,
      isAuthenticated, isLoading, isExistingUser, areBiometricsAvailable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthBlocStateImplCopyWith<_$AuthBlocStateImpl> get copyWith =>
      __$$AuthBlocStateImplCopyWithImpl<_$AuthBlocStateImpl>(this, _$identity);
}

abstract class _AuthBlocState implements AuthBlocState {
  factory _AuthBlocState(
      {final AuthMethod authMethod,
      final String? enteredPin,
      final bool isAuthenticated,
      final bool isLoading,
      final bool isExistingUser,
      final bool areBiometricsAvailable}) = _$AuthBlocStateImpl;

  @override
  AuthMethod get authMethod;
  @override
  String? get enteredPin;
  @override
  bool get isAuthenticated;
  @override
  bool get isLoading;
  @override
  bool get isExistingUser;
  @override
  bool get areBiometricsAvailable;
  @override
  @JsonKey(ignore: true)
  _$$AuthBlocStateImplCopyWith<_$AuthBlocStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
