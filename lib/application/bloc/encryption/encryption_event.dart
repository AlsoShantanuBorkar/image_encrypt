import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:file_encrypt/application/bloc/encryption/encryption_bloc.dart';
import 'package:file_encrypt/core/models/encrypted_image_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'encryption_event.freezed.dart';

@freezed
abstract class EncryptionBlocEvent with _$EncryptionBlocEvent {
  factory EncryptionBlocEvent.decryptImage(
      {required EncryptedImageModel image,
      required BuildContext context}) = _DecryptImage;
  factory EncryptionBlocEvent.encryptImage(
      {required XFile image, required BuildContext context}) = _EncryptImage;
  factory EncryptionBlocEvent.previewImage(
      {required EncryptedImageModel image,
      required BuildContext context}) = _PreviewImage;
  factory EncryptionBlocEvent.closePreview(
      {required EncryptedImageModel image,
      required BuildContext context}) = _ClosePreview;
  factory EncryptionBlocEvent.init() = _Init;
}
