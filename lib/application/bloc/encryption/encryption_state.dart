import 'dart:io';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:file_encrypt/core/models/encrypted_image_model.dart';
import 'package:file_encrypt/objectbox.g.dart';
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
