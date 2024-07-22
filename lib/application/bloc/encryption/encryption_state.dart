import 'dart:typed_data';

import 'package:file_encrypt/core/models/encrypted_image_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'encryption_state.freezed.dart';

@freezed
class EncryptionBlocState with _$EncryptionBlocState {
  factory EncryptionBlocState({
    @Default(false) bool isLoading,
    @Default([]) List<EncryptedImageModel> images,
    @Default(null) Uint8List? currentPreviewImage,
    @Default(null) EncryptedImageModel? currentPreviewImageModel,
  }) = _EncryptionBlocState;
}
