// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'encryption_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EncryptionBlocState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<EncryptedImageModel> get images => throw _privateConstructorUsedError;
  Uint8List? get currentPreviewImage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EncryptionBlocStateCopyWith<EncryptionBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EncryptionBlocStateCopyWith<$Res> {
  factory $EncryptionBlocStateCopyWith(
          EncryptionBlocState value, $Res Function(EncryptionBlocState) then) =
      _$EncryptionBlocStateCopyWithImpl<$Res, EncryptionBlocState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<EncryptedImageModel> images,
      Uint8List? currentPreviewImage});
}

/// @nodoc
class _$EncryptionBlocStateCopyWithImpl<$Res, $Val extends EncryptionBlocState>
    implements $EncryptionBlocStateCopyWith<$Res> {
  _$EncryptionBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? images = null,
    Object? currentPreviewImage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<EncryptedImageModel>,
      currentPreviewImage: freezed == currentPreviewImage
          ? _value.currentPreviewImage
          : currentPreviewImage // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EncryptionBlocStateImplCopyWith<$Res>
    implements $EncryptionBlocStateCopyWith<$Res> {
  factory _$$EncryptionBlocStateImplCopyWith(_$EncryptionBlocStateImpl value,
          $Res Function(_$EncryptionBlocStateImpl) then) =
      __$$EncryptionBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<EncryptedImageModel> images,
      Uint8List? currentPreviewImage});
}

/// @nodoc
class __$$EncryptionBlocStateImplCopyWithImpl<$Res>
    extends _$EncryptionBlocStateCopyWithImpl<$Res, _$EncryptionBlocStateImpl>
    implements _$$EncryptionBlocStateImplCopyWith<$Res> {
  __$$EncryptionBlocStateImplCopyWithImpl(_$EncryptionBlocStateImpl _value,
      $Res Function(_$EncryptionBlocStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? images = null,
    Object? currentPreviewImage = freezed,
  }) {
    return _then(_$EncryptionBlocStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<EncryptedImageModel>,
      currentPreviewImage: freezed == currentPreviewImage
          ? _value.currentPreviewImage
          : currentPreviewImage // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$EncryptionBlocStateImpl implements _EncryptionBlocState {
  _$EncryptionBlocStateImpl(
      {this.isLoading = false,
      final List<EncryptedImageModel> images = const [],
      this.currentPreviewImage = null})
      : _images = images;

  @override
  @JsonKey()
  final bool isLoading;
  final List<EncryptedImageModel> _images;
  @override
  @JsonKey()
  List<EncryptedImageModel> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey()
  final Uint8List? currentPreviewImage;

  @override
  String toString() {
    return 'EncryptionBlocState(isLoading: $isLoading, images: $images, currentPreviewImage: $currentPreviewImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EncryptionBlocStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other.currentPreviewImage, currentPreviewImage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(currentPreviewImage));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EncryptionBlocStateImplCopyWith<_$EncryptionBlocStateImpl> get copyWith =>
      __$$EncryptionBlocStateImplCopyWithImpl<_$EncryptionBlocStateImpl>(
          this, _$identity);
}

abstract class _EncryptionBlocState implements EncryptionBlocState {
  factory _EncryptionBlocState(
      {final bool isLoading,
      final List<EncryptedImageModel> images,
      final Uint8List? currentPreviewImage}) = _$EncryptionBlocStateImpl;

  @override
  bool get isLoading;
  @override
  List<EncryptedImageModel> get images;
  @override
  Uint8List? get currentPreviewImage;
  @override
  @JsonKey(ignore: true)
  _$$EncryptionBlocStateImplCopyWith<_$EncryptionBlocStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
