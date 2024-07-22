// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(AuthMethod authMethod) selectAuthMethod,
    required TResult Function(String pin, BuildContext context) enterPin,
    required TResult Function(String newPin, BuildContext context) resetPin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(AuthMethod authMethod)? selectAuthMethod,
    TResult? Function(String pin, BuildContext context)? enterPin,
    TResult? Function(String newPin, BuildContext context)? resetPin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(AuthMethod authMethod)? selectAuthMethod,
    TResult Function(String pin, BuildContext context)? enterPin,
    TResult Function(String newPin, BuildContext context)? resetPin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_SelectAuthMethod value) selectAuthMethod,
    required TResult Function(_EnterPin value) enterPin,
    required TResult Function(_ResetPin value) resetPin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_SelectAuthMethod value)? selectAuthMethod,
    TResult? Function(_EnterPin value)? enterPin,
    TResult? Function(_ResetPin value)? resetPin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_SelectAuthMethod value)? selectAuthMethod,
    TResult Function(_EnterPin value)? enterPin,
    TResult Function(_ResetPin value)? resetPin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthBlocEventCopyWith<$Res> {
  factory $AuthBlocEventCopyWith(
          AuthBlocEvent value, $Res Function(AuthBlocEvent) then) =
      _$AuthBlocEventCopyWithImpl<$Res, AuthBlocEvent>;
}

/// @nodoc
class _$AuthBlocEventCopyWithImpl<$Res, $Val extends AuthBlocEvent>
    implements $AuthBlocEventCopyWith<$Res> {
  _$AuthBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$AuthBlocEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  _$InitImpl();

  @override
  String toString() {
    return 'AuthBlocEvent.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(AuthMethod authMethod) selectAuthMethod,
    required TResult Function(String pin, BuildContext context) enterPin,
    required TResult Function(String newPin, BuildContext context) resetPin,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(AuthMethod authMethod)? selectAuthMethod,
    TResult? Function(String pin, BuildContext context)? enterPin,
    TResult? Function(String newPin, BuildContext context)? resetPin,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(AuthMethod authMethod)? selectAuthMethod,
    TResult Function(String pin, BuildContext context)? enterPin,
    TResult Function(String newPin, BuildContext context)? resetPin,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_SelectAuthMethod value) selectAuthMethod,
    required TResult Function(_EnterPin value) enterPin,
    required TResult Function(_ResetPin value) resetPin,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_SelectAuthMethod value)? selectAuthMethod,
    TResult? Function(_EnterPin value)? enterPin,
    TResult? Function(_ResetPin value)? resetPin,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_SelectAuthMethod value)? selectAuthMethod,
    TResult Function(_EnterPin value)? enterPin,
    TResult Function(_ResetPin value)? resetPin,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements AuthBlocEvent {
  factory _Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$SelectAuthMethodImplCopyWith<$Res> {
  factory _$$SelectAuthMethodImplCopyWith(_$SelectAuthMethodImpl value,
          $Res Function(_$SelectAuthMethodImpl) then) =
      __$$SelectAuthMethodImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthMethod authMethod});
}

/// @nodoc
class __$$SelectAuthMethodImplCopyWithImpl<$Res>
    extends _$AuthBlocEventCopyWithImpl<$Res, _$SelectAuthMethodImpl>
    implements _$$SelectAuthMethodImplCopyWith<$Res> {
  __$$SelectAuthMethodImplCopyWithImpl(_$SelectAuthMethodImpl _value,
      $Res Function(_$SelectAuthMethodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authMethod = null,
  }) {
    return _then(_$SelectAuthMethodImpl(
      authMethod: null == authMethod
          ? _value.authMethod
          : authMethod // ignore: cast_nullable_to_non_nullable
              as AuthMethod,
    ));
  }
}

/// @nodoc

class _$SelectAuthMethodImpl implements _SelectAuthMethod {
  _$SelectAuthMethodImpl({required this.authMethod});

  @override
  final AuthMethod authMethod;

  @override
  String toString() {
    return 'AuthBlocEvent.selectAuthMethod(authMethod: $authMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectAuthMethodImpl &&
            (identical(other.authMethod, authMethod) ||
                other.authMethod == authMethod));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authMethod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectAuthMethodImplCopyWith<_$SelectAuthMethodImpl> get copyWith =>
      __$$SelectAuthMethodImplCopyWithImpl<_$SelectAuthMethodImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(AuthMethod authMethod) selectAuthMethod,
    required TResult Function(String pin, BuildContext context) enterPin,
    required TResult Function(String newPin, BuildContext context) resetPin,
  }) {
    return selectAuthMethod(authMethod);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(AuthMethod authMethod)? selectAuthMethod,
    TResult? Function(String pin, BuildContext context)? enterPin,
    TResult? Function(String newPin, BuildContext context)? resetPin,
  }) {
    return selectAuthMethod?.call(authMethod);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(AuthMethod authMethod)? selectAuthMethod,
    TResult Function(String pin, BuildContext context)? enterPin,
    TResult Function(String newPin, BuildContext context)? resetPin,
    required TResult orElse(),
  }) {
    if (selectAuthMethod != null) {
      return selectAuthMethod(authMethod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_SelectAuthMethod value) selectAuthMethod,
    required TResult Function(_EnterPin value) enterPin,
    required TResult Function(_ResetPin value) resetPin,
  }) {
    return selectAuthMethod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_SelectAuthMethod value)? selectAuthMethod,
    TResult? Function(_EnterPin value)? enterPin,
    TResult? Function(_ResetPin value)? resetPin,
  }) {
    return selectAuthMethod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_SelectAuthMethod value)? selectAuthMethod,
    TResult Function(_EnterPin value)? enterPin,
    TResult Function(_ResetPin value)? resetPin,
    required TResult orElse(),
  }) {
    if (selectAuthMethod != null) {
      return selectAuthMethod(this);
    }
    return orElse();
  }
}

abstract class _SelectAuthMethod implements AuthBlocEvent {
  factory _SelectAuthMethod({required final AuthMethod authMethod}) =
      _$SelectAuthMethodImpl;

  AuthMethod get authMethod;
  @JsonKey(ignore: true)
  _$$SelectAuthMethodImplCopyWith<_$SelectAuthMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EnterPinImplCopyWith<$Res> {
  factory _$$EnterPinImplCopyWith(
          _$EnterPinImpl value, $Res Function(_$EnterPinImpl) then) =
      __$$EnterPinImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String pin, BuildContext context});
}

/// @nodoc
class __$$EnterPinImplCopyWithImpl<$Res>
    extends _$AuthBlocEventCopyWithImpl<$Res, _$EnterPinImpl>
    implements _$$EnterPinImplCopyWith<$Res> {
  __$$EnterPinImplCopyWithImpl(
      _$EnterPinImpl _value, $Res Function(_$EnterPinImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pin = null,
    Object? context = null,
  }) {
    return _then(_$EnterPinImpl(
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$EnterPinImpl implements _EnterPin {
  _$EnterPinImpl({required this.pin, required this.context});

  @override
  final String pin;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'AuthBlocEvent.enterPin(pin: $pin, context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnterPinImpl &&
            (identical(other.pin, pin) || other.pin == pin) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pin, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnterPinImplCopyWith<_$EnterPinImpl> get copyWith =>
      __$$EnterPinImplCopyWithImpl<_$EnterPinImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(AuthMethod authMethod) selectAuthMethod,
    required TResult Function(String pin, BuildContext context) enterPin,
    required TResult Function(String newPin, BuildContext context) resetPin,
  }) {
    return enterPin(pin, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(AuthMethod authMethod)? selectAuthMethod,
    TResult? Function(String pin, BuildContext context)? enterPin,
    TResult? Function(String newPin, BuildContext context)? resetPin,
  }) {
    return enterPin?.call(pin, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(AuthMethod authMethod)? selectAuthMethod,
    TResult Function(String pin, BuildContext context)? enterPin,
    TResult Function(String newPin, BuildContext context)? resetPin,
    required TResult orElse(),
  }) {
    if (enterPin != null) {
      return enterPin(pin, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_SelectAuthMethod value) selectAuthMethod,
    required TResult Function(_EnterPin value) enterPin,
    required TResult Function(_ResetPin value) resetPin,
  }) {
    return enterPin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_SelectAuthMethod value)? selectAuthMethod,
    TResult? Function(_EnterPin value)? enterPin,
    TResult? Function(_ResetPin value)? resetPin,
  }) {
    return enterPin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_SelectAuthMethod value)? selectAuthMethod,
    TResult Function(_EnterPin value)? enterPin,
    TResult Function(_ResetPin value)? resetPin,
    required TResult orElse(),
  }) {
    if (enterPin != null) {
      return enterPin(this);
    }
    return orElse();
  }
}

abstract class _EnterPin implements AuthBlocEvent {
  factory _EnterPin(
      {required final String pin,
      required final BuildContext context}) = _$EnterPinImpl;

  String get pin;
  BuildContext get context;
  @JsonKey(ignore: true)
  _$$EnterPinImplCopyWith<_$EnterPinImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPinImplCopyWith<$Res> {
  factory _$$ResetPinImplCopyWith(
          _$ResetPinImpl value, $Res Function(_$ResetPinImpl) then) =
      __$$ResetPinImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String newPin, BuildContext context});
}

/// @nodoc
class __$$ResetPinImplCopyWithImpl<$Res>
    extends _$AuthBlocEventCopyWithImpl<$Res, _$ResetPinImpl>
    implements _$$ResetPinImplCopyWith<$Res> {
  __$$ResetPinImplCopyWithImpl(
      _$ResetPinImpl _value, $Res Function(_$ResetPinImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPin = null,
    Object? context = null,
  }) {
    return _then(_$ResetPinImpl(
      newPin: null == newPin
          ? _value.newPin
          : newPin // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$ResetPinImpl implements _ResetPin {
  _$ResetPinImpl({required this.newPin, required this.context});

  @override
  final String newPin;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'AuthBlocEvent.resetPin(newPin: $newPin, context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPinImpl &&
            (identical(other.newPin, newPin) || other.newPin == newPin) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newPin, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPinImplCopyWith<_$ResetPinImpl> get copyWith =>
      __$$ResetPinImplCopyWithImpl<_$ResetPinImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(AuthMethod authMethod) selectAuthMethod,
    required TResult Function(String pin, BuildContext context) enterPin,
    required TResult Function(String newPin, BuildContext context) resetPin,
  }) {
    return resetPin(newPin, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(AuthMethod authMethod)? selectAuthMethod,
    TResult? Function(String pin, BuildContext context)? enterPin,
    TResult? Function(String newPin, BuildContext context)? resetPin,
  }) {
    return resetPin?.call(newPin, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(AuthMethod authMethod)? selectAuthMethod,
    TResult Function(String pin, BuildContext context)? enterPin,
    TResult Function(String newPin, BuildContext context)? resetPin,
    required TResult orElse(),
  }) {
    if (resetPin != null) {
      return resetPin(newPin, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_SelectAuthMethod value) selectAuthMethod,
    required TResult Function(_EnterPin value) enterPin,
    required TResult Function(_ResetPin value) resetPin,
  }) {
    return resetPin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_SelectAuthMethod value)? selectAuthMethod,
    TResult? Function(_EnterPin value)? enterPin,
    TResult? Function(_ResetPin value)? resetPin,
  }) {
    return resetPin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_SelectAuthMethod value)? selectAuthMethod,
    TResult Function(_EnterPin value)? enterPin,
    TResult Function(_ResetPin value)? resetPin,
    required TResult orElse(),
  }) {
    if (resetPin != null) {
      return resetPin(this);
    }
    return orElse();
  }
}

abstract class _ResetPin implements AuthBlocEvent {
  factory _ResetPin(
      {required final String newPin,
      required final BuildContext context}) = _$ResetPinImpl;

  String get newPin;
  BuildContext get context;
  @JsonKey(ignore: true)
  _$$ResetPinImplCopyWith<_$ResetPinImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
