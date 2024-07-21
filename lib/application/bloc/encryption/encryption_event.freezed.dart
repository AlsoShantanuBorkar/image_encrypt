// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'encryption_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EncryptionBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EncryptedImageModel image, BuildContext context)
        decryptImage,
    required TResult Function(XFile image, BuildContext context) encryptImage,
    required TResult Function(EncryptedImageModel image, BuildContext context)
        previewImage,
    required TResult Function(EncryptedImageModel image, BuildContext context)
        closePreview,
    required TResult Function() init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EncryptedImageModel image, BuildContext context)?
        decryptImage,
    TResult? Function(XFile image, BuildContext context)? encryptImage,
    TResult? Function(EncryptedImageModel image, BuildContext context)?
        previewImage,
    TResult? Function(EncryptedImageModel image, BuildContext context)?
        closePreview,
    TResult? Function()? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EncryptedImageModel image, BuildContext context)?
        decryptImage,
    TResult Function(XFile image, BuildContext context)? encryptImage,
    TResult Function(EncryptedImageModel image, BuildContext context)?
        previewImage,
    TResult Function(EncryptedImageModel image, BuildContext context)?
        closePreview,
    TResult Function()? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DecryptImage value) decryptImage,
    required TResult Function(_EncryptImage value) encryptImage,
    required TResult Function(_PreviewImage value) previewImage,
    required TResult Function(_ClosePreview value) closePreview,
    required TResult Function(_Init value) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DecryptImage value)? decryptImage,
    TResult? Function(_EncryptImage value)? encryptImage,
    TResult? Function(_PreviewImage value)? previewImage,
    TResult? Function(_ClosePreview value)? closePreview,
    TResult? Function(_Init value)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DecryptImage value)? decryptImage,
    TResult Function(_EncryptImage value)? encryptImage,
    TResult Function(_PreviewImage value)? previewImage,
    TResult Function(_ClosePreview value)? closePreview,
    TResult Function(_Init value)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EncryptionBlocEventCopyWith<$Res> {
  factory $EncryptionBlocEventCopyWith(
          EncryptionBlocEvent value, $Res Function(EncryptionBlocEvent) then) =
      _$EncryptionBlocEventCopyWithImpl<$Res, EncryptionBlocEvent>;
}

/// @nodoc
class _$EncryptionBlocEventCopyWithImpl<$Res, $Val extends EncryptionBlocEvent>
    implements $EncryptionBlocEventCopyWith<$Res> {
  _$EncryptionBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DecryptImageImplCopyWith<$Res> {
  factory _$$DecryptImageImplCopyWith(
          _$DecryptImageImpl value, $Res Function(_$DecryptImageImpl) then) =
      __$$DecryptImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EncryptedImageModel image, BuildContext context});
}

/// @nodoc
class __$$DecryptImageImplCopyWithImpl<$Res>
    extends _$EncryptionBlocEventCopyWithImpl<$Res, _$DecryptImageImpl>
    implements _$$DecryptImageImplCopyWith<$Res> {
  __$$DecryptImageImplCopyWithImpl(
      _$DecryptImageImpl _value, $Res Function(_$DecryptImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? context = null,
  }) {
    return _then(_$DecryptImageImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as EncryptedImageModel,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$DecryptImageImpl with DiagnosticableTreeMixin implements _DecryptImage {
  _$DecryptImageImpl({required this.image, required this.context});

  @override
  final EncryptedImageModel image;
  @override
  final BuildContext context;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EncryptionBlocEvent.decryptImage(image: $image, context: $context)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EncryptionBlocEvent.decryptImage'))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('context', context));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DecryptImageImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DecryptImageImplCopyWith<_$DecryptImageImpl> get copyWith =>
      __$$DecryptImageImplCopyWithImpl<_$DecryptImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EncryptedImageModel image, BuildContext context)
        decryptImage,
    required TResult Function(XFile image, BuildContext context) encryptImage,
    required TResult Function(EncryptedImageModel image, BuildContext context)
        previewImage,
    required TResult Function(EncryptedImageModel image, BuildContext context)
        closePreview,
    required TResult Function() init,
  }) {
    return decryptImage(image, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EncryptedImageModel image, BuildContext context)?
        decryptImage,
    TResult? Function(XFile image, BuildContext context)? encryptImage,
    TResult? Function(EncryptedImageModel image, BuildContext context)?
        previewImage,
    TResult? Function(EncryptedImageModel image, BuildContext context)?
        closePreview,
    TResult? Function()? init,
  }) {
    return decryptImage?.call(image, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EncryptedImageModel image, BuildContext context)?
        decryptImage,
    TResult Function(XFile image, BuildContext context)? encryptImage,
    TResult Function(EncryptedImageModel image, BuildContext context)?
        previewImage,
    TResult Function(EncryptedImageModel image, BuildContext context)?
        closePreview,
    TResult Function()? init,
    required TResult orElse(),
  }) {
    if (decryptImage != null) {
      return decryptImage(image, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DecryptImage value) decryptImage,
    required TResult Function(_EncryptImage value) encryptImage,
    required TResult Function(_PreviewImage value) previewImage,
    required TResult Function(_ClosePreview value) closePreview,
    required TResult Function(_Init value) init,
  }) {
    return decryptImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DecryptImage value)? decryptImage,
    TResult? Function(_EncryptImage value)? encryptImage,
    TResult? Function(_PreviewImage value)? previewImage,
    TResult? Function(_ClosePreview value)? closePreview,
    TResult? Function(_Init value)? init,
  }) {
    return decryptImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DecryptImage value)? decryptImage,
    TResult Function(_EncryptImage value)? encryptImage,
    TResult Function(_PreviewImage value)? previewImage,
    TResult Function(_ClosePreview value)? closePreview,
    TResult Function(_Init value)? init,
    required TResult orElse(),
  }) {
    if (decryptImage != null) {
      return decryptImage(this);
    }
    return orElse();
  }
}

abstract class _DecryptImage implements EncryptionBlocEvent {
  factory _DecryptImage(
      {required final EncryptedImageModel image,
      required final BuildContext context}) = _$DecryptImageImpl;

  EncryptedImageModel get image;
  BuildContext get context;
  @JsonKey(ignore: true)
  _$$DecryptImageImplCopyWith<_$DecryptImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EncryptImageImplCopyWith<$Res> {
  factory _$$EncryptImageImplCopyWith(
          _$EncryptImageImpl value, $Res Function(_$EncryptImageImpl) then) =
      __$$EncryptImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({XFile image, BuildContext context});
}

/// @nodoc
class __$$EncryptImageImplCopyWithImpl<$Res>
    extends _$EncryptionBlocEventCopyWithImpl<$Res, _$EncryptImageImpl>
    implements _$$EncryptImageImplCopyWith<$Res> {
  __$$EncryptImageImplCopyWithImpl(
      _$EncryptImageImpl _value, $Res Function(_$EncryptImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? context = null,
  }) {
    return _then(_$EncryptImageImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as XFile,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$EncryptImageImpl with DiagnosticableTreeMixin implements _EncryptImage {
  _$EncryptImageImpl({required this.image, required this.context});

  @override
  final XFile image;
  @override
  final BuildContext context;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EncryptionBlocEvent.encryptImage(image: $image, context: $context)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EncryptionBlocEvent.encryptImage'))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('context', context));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EncryptImageImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EncryptImageImplCopyWith<_$EncryptImageImpl> get copyWith =>
      __$$EncryptImageImplCopyWithImpl<_$EncryptImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EncryptedImageModel image, BuildContext context)
        decryptImage,
    required TResult Function(XFile image, BuildContext context) encryptImage,
    required TResult Function(EncryptedImageModel image, BuildContext context)
        previewImage,
    required TResult Function(EncryptedImageModel image, BuildContext context)
        closePreview,
    required TResult Function() init,
  }) {
    return encryptImage(image, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EncryptedImageModel image, BuildContext context)?
        decryptImage,
    TResult? Function(XFile image, BuildContext context)? encryptImage,
    TResult? Function(EncryptedImageModel image, BuildContext context)?
        previewImage,
    TResult? Function(EncryptedImageModel image, BuildContext context)?
        closePreview,
    TResult? Function()? init,
  }) {
    return encryptImage?.call(image, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EncryptedImageModel image, BuildContext context)?
        decryptImage,
    TResult Function(XFile image, BuildContext context)? encryptImage,
    TResult Function(EncryptedImageModel image, BuildContext context)?
        previewImage,
    TResult Function(EncryptedImageModel image, BuildContext context)?
        closePreview,
    TResult Function()? init,
    required TResult orElse(),
  }) {
    if (encryptImage != null) {
      return encryptImage(image, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DecryptImage value) decryptImage,
    required TResult Function(_EncryptImage value) encryptImage,
    required TResult Function(_PreviewImage value) previewImage,
    required TResult Function(_ClosePreview value) closePreview,
    required TResult Function(_Init value) init,
  }) {
    return encryptImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DecryptImage value)? decryptImage,
    TResult? Function(_EncryptImage value)? encryptImage,
    TResult? Function(_PreviewImage value)? previewImage,
    TResult? Function(_ClosePreview value)? closePreview,
    TResult? Function(_Init value)? init,
  }) {
    return encryptImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DecryptImage value)? decryptImage,
    TResult Function(_EncryptImage value)? encryptImage,
    TResult Function(_PreviewImage value)? previewImage,
    TResult Function(_ClosePreview value)? closePreview,
    TResult Function(_Init value)? init,
    required TResult orElse(),
  }) {
    if (encryptImage != null) {
      return encryptImage(this);
    }
    return orElse();
  }
}

abstract class _EncryptImage implements EncryptionBlocEvent {
  factory _EncryptImage(
      {required final XFile image,
      required final BuildContext context}) = _$EncryptImageImpl;

  XFile get image;
  BuildContext get context;
  @JsonKey(ignore: true)
  _$$EncryptImageImplCopyWith<_$EncryptImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PreviewImageImplCopyWith<$Res> {
  factory _$$PreviewImageImplCopyWith(
          _$PreviewImageImpl value, $Res Function(_$PreviewImageImpl) then) =
      __$$PreviewImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EncryptedImageModel image, BuildContext context});
}

/// @nodoc
class __$$PreviewImageImplCopyWithImpl<$Res>
    extends _$EncryptionBlocEventCopyWithImpl<$Res, _$PreviewImageImpl>
    implements _$$PreviewImageImplCopyWith<$Res> {
  __$$PreviewImageImplCopyWithImpl(
      _$PreviewImageImpl _value, $Res Function(_$PreviewImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? context = null,
  }) {
    return _then(_$PreviewImageImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as EncryptedImageModel,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$PreviewImageImpl with DiagnosticableTreeMixin implements _PreviewImage {
  _$PreviewImageImpl({required this.image, required this.context});

  @override
  final EncryptedImageModel image;
  @override
  final BuildContext context;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EncryptionBlocEvent.previewImage(image: $image, context: $context)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EncryptionBlocEvent.previewImage'))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('context', context));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreviewImageImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreviewImageImplCopyWith<_$PreviewImageImpl> get copyWith =>
      __$$PreviewImageImplCopyWithImpl<_$PreviewImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EncryptedImageModel image, BuildContext context)
        decryptImage,
    required TResult Function(XFile image, BuildContext context) encryptImage,
    required TResult Function(EncryptedImageModel image, BuildContext context)
        previewImage,
    required TResult Function(EncryptedImageModel image, BuildContext context)
        closePreview,
    required TResult Function() init,
  }) {
    return previewImage(image, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EncryptedImageModel image, BuildContext context)?
        decryptImage,
    TResult? Function(XFile image, BuildContext context)? encryptImage,
    TResult? Function(EncryptedImageModel image, BuildContext context)?
        previewImage,
    TResult? Function(EncryptedImageModel image, BuildContext context)?
        closePreview,
    TResult? Function()? init,
  }) {
    return previewImage?.call(image, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EncryptedImageModel image, BuildContext context)?
        decryptImage,
    TResult Function(XFile image, BuildContext context)? encryptImage,
    TResult Function(EncryptedImageModel image, BuildContext context)?
        previewImage,
    TResult Function(EncryptedImageModel image, BuildContext context)?
        closePreview,
    TResult Function()? init,
    required TResult orElse(),
  }) {
    if (previewImage != null) {
      return previewImage(image, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DecryptImage value) decryptImage,
    required TResult Function(_EncryptImage value) encryptImage,
    required TResult Function(_PreviewImage value) previewImage,
    required TResult Function(_ClosePreview value) closePreview,
    required TResult Function(_Init value) init,
  }) {
    return previewImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DecryptImage value)? decryptImage,
    TResult? Function(_EncryptImage value)? encryptImage,
    TResult? Function(_PreviewImage value)? previewImage,
    TResult? Function(_ClosePreview value)? closePreview,
    TResult? Function(_Init value)? init,
  }) {
    return previewImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DecryptImage value)? decryptImage,
    TResult Function(_EncryptImage value)? encryptImage,
    TResult Function(_PreviewImage value)? previewImage,
    TResult Function(_ClosePreview value)? closePreview,
    TResult Function(_Init value)? init,
    required TResult orElse(),
  }) {
    if (previewImage != null) {
      return previewImage(this);
    }
    return orElse();
  }
}

abstract class _PreviewImage implements EncryptionBlocEvent {
  factory _PreviewImage(
      {required final EncryptedImageModel image,
      required final BuildContext context}) = _$PreviewImageImpl;

  EncryptedImageModel get image;
  BuildContext get context;
  @JsonKey(ignore: true)
  _$$PreviewImageImplCopyWith<_$PreviewImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClosePreviewImplCopyWith<$Res> {
  factory _$$ClosePreviewImplCopyWith(
          _$ClosePreviewImpl value, $Res Function(_$ClosePreviewImpl) then) =
      __$$ClosePreviewImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EncryptedImageModel image, BuildContext context});
}

/// @nodoc
class __$$ClosePreviewImplCopyWithImpl<$Res>
    extends _$EncryptionBlocEventCopyWithImpl<$Res, _$ClosePreviewImpl>
    implements _$$ClosePreviewImplCopyWith<$Res> {
  __$$ClosePreviewImplCopyWithImpl(
      _$ClosePreviewImpl _value, $Res Function(_$ClosePreviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? context = null,
  }) {
    return _then(_$ClosePreviewImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as EncryptedImageModel,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$ClosePreviewImpl with DiagnosticableTreeMixin implements _ClosePreview {
  _$ClosePreviewImpl({required this.image, required this.context});

  @override
  final EncryptedImageModel image;
  @override
  final BuildContext context;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EncryptionBlocEvent.closePreview(image: $image, context: $context)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EncryptionBlocEvent.closePreview'))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('context', context));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosePreviewImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClosePreviewImplCopyWith<_$ClosePreviewImpl> get copyWith =>
      __$$ClosePreviewImplCopyWithImpl<_$ClosePreviewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EncryptedImageModel image, BuildContext context)
        decryptImage,
    required TResult Function(XFile image, BuildContext context) encryptImage,
    required TResult Function(EncryptedImageModel image, BuildContext context)
        previewImage,
    required TResult Function(EncryptedImageModel image, BuildContext context)
        closePreview,
    required TResult Function() init,
  }) {
    return closePreview(image, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EncryptedImageModel image, BuildContext context)?
        decryptImage,
    TResult? Function(XFile image, BuildContext context)? encryptImage,
    TResult? Function(EncryptedImageModel image, BuildContext context)?
        previewImage,
    TResult? Function(EncryptedImageModel image, BuildContext context)?
        closePreview,
    TResult? Function()? init,
  }) {
    return closePreview?.call(image, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EncryptedImageModel image, BuildContext context)?
        decryptImage,
    TResult Function(XFile image, BuildContext context)? encryptImage,
    TResult Function(EncryptedImageModel image, BuildContext context)?
        previewImage,
    TResult Function(EncryptedImageModel image, BuildContext context)?
        closePreview,
    TResult Function()? init,
    required TResult orElse(),
  }) {
    if (closePreview != null) {
      return closePreview(image, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DecryptImage value) decryptImage,
    required TResult Function(_EncryptImage value) encryptImage,
    required TResult Function(_PreviewImage value) previewImage,
    required TResult Function(_ClosePreview value) closePreview,
    required TResult Function(_Init value) init,
  }) {
    return closePreview(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DecryptImage value)? decryptImage,
    TResult? Function(_EncryptImage value)? encryptImage,
    TResult? Function(_PreviewImage value)? previewImage,
    TResult? Function(_ClosePreview value)? closePreview,
    TResult? Function(_Init value)? init,
  }) {
    return closePreview?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DecryptImage value)? decryptImage,
    TResult Function(_EncryptImage value)? encryptImage,
    TResult Function(_PreviewImage value)? previewImage,
    TResult Function(_ClosePreview value)? closePreview,
    TResult Function(_Init value)? init,
    required TResult orElse(),
  }) {
    if (closePreview != null) {
      return closePreview(this);
    }
    return orElse();
  }
}

abstract class _ClosePreview implements EncryptionBlocEvent {
  factory _ClosePreview(
      {required final EncryptedImageModel image,
      required final BuildContext context}) = _$ClosePreviewImpl;

  EncryptedImageModel get image;
  BuildContext get context;
  @JsonKey(ignore: true)
  _$$ClosePreviewImplCopyWith<_$ClosePreviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$EncryptionBlocEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl with DiagnosticableTreeMixin implements _Init {
  _$InitImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EncryptionBlocEvent.init()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'EncryptionBlocEvent.init'));
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
    required TResult Function(EncryptedImageModel image, BuildContext context)
        decryptImage,
    required TResult Function(XFile image, BuildContext context) encryptImage,
    required TResult Function(EncryptedImageModel image, BuildContext context)
        previewImage,
    required TResult Function(EncryptedImageModel image, BuildContext context)
        closePreview,
    required TResult Function() init,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EncryptedImageModel image, BuildContext context)?
        decryptImage,
    TResult? Function(XFile image, BuildContext context)? encryptImage,
    TResult? Function(EncryptedImageModel image, BuildContext context)?
        previewImage,
    TResult? Function(EncryptedImageModel image, BuildContext context)?
        closePreview,
    TResult? Function()? init,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EncryptedImageModel image, BuildContext context)?
        decryptImage,
    TResult Function(XFile image, BuildContext context)? encryptImage,
    TResult Function(EncryptedImageModel image, BuildContext context)?
        previewImage,
    TResult Function(EncryptedImageModel image, BuildContext context)?
        closePreview,
    TResult Function()? init,
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
    required TResult Function(_DecryptImage value) decryptImage,
    required TResult Function(_EncryptImage value) encryptImage,
    required TResult Function(_PreviewImage value) previewImage,
    required TResult Function(_ClosePreview value) closePreview,
    required TResult Function(_Init value) init,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DecryptImage value)? decryptImage,
    TResult? Function(_EncryptImage value)? encryptImage,
    TResult? Function(_PreviewImage value)? previewImage,
    TResult? Function(_ClosePreview value)? closePreview,
    TResult? Function(_Init value)? init,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DecryptImage value)? decryptImage,
    TResult Function(_EncryptImage value)? encryptImage,
    TResult Function(_PreviewImage value)? previewImage,
    TResult Function(_ClosePreview value)? closePreview,
    TResult Function(_Init value)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements EncryptionBlocEvent {
  factory _Init() = _$InitImpl;
}
