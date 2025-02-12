import 'dart:io';

import 'package:image_encrypt/core/models/encrypted_image_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'encryption_event.freezed.dart';

@freezed
abstract class EncryptionBlocEvent with _$EncryptionBlocEvent {
  factory EncryptionBlocEvent.decryptImage(
      {required EncryptedImageModel image,
      required BuildContext context}) = _DecryptImage;
  factory EncryptionBlocEvent.encryptImage(
      {required File image,
      required String id,
      required String originalImagePath,
      required BuildContext context}) = _EncryptImage;
  factory EncryptionBlocEvent.previewImage(
      {required EncryptedImageModel image,
      required BuildContext context}) = _PreviewImage;
  factory EncryptionBlocEvent.closePreview(
      {required EncryptedImageModel image,
      required BuildContext context}) = _ClosePreview;
  factory EncryptionBlocEvent.init() = _Init;
}
