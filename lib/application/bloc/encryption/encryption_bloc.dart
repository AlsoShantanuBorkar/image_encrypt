import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';
import 'dart:ui';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:file_encrypt/application/bloc/encryption/encryption_event.dart';
import 'package:file_encrypt/application/bloc/encryption/encryption_state.dart';
import 'package:file_encrypt/core/database/objectbox.dart';
import 'package:file_encrypt/core/models/encrypted_image_model.dart';
import 'package:file_encrypt/core/services/encryption_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

class EncryptionBloc extends Bloc<EncryptionBlocEvent, EncryptionBlocState> {
  late final ObjectBoxAdapter _objectBoxAdapter;

  final String _key = '6Vd2Jnd6PQQAcM2wkwEZGaTv0e1kCeEy'; // 32 chars
  final String _iv = '18d049I76d5qbfkj'; // 16 chars

  EncryptionBloc({required ObjectBoxAdapter objectBoxAdapter})
      : super(EncryptionBlocState()) {
    _objectBoxAdapter = objectBoxAdapter;

    on<EncryptionBlocEvent>(
      (event, emit) async {
        await event.when<FutureOr<void>>(
          init: () {
            emit(state.copyWith(images: objectBoxAdapter.images.getAll()));
            FlutterLogs.logInfo("EncryptionBloc Log", "Action: Init Bloc", "");
          },
          decryptImage:
              (EncryptedImageModel imageModel, BuildContext context) async {
            emit(state.copyWith(isLoading: true));

            try {
              await compute(
                  EncryptionService.decryptImageIsolateHandler,
                  DecryptFileIsolateArgs(
                    rootIsolateToken: RootIsolateToken.instance!,
                    encryptedImageModel: imageModel,
                    key: _key,
                    iv: _iv,
                  )).then((val) {
                objectBoxAdapter.removeEncryptedImageModel(imageModel);

                List<EncryptedImageModel> imgs =
                    objectBoxAdapter.images.getAll();
                emit(state.copyWith(isLoading: false, images: imgs));

                FlutterLogs.logInfo(
                    "EncryptionBloc Log",
                    "Action: Decrypt Image",
                    "Image Name: ${imageModel.imageName} Creation Date: ${imageModel.dateCreated.toIso8601String()}");
              });
            } catch (e) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Error Occured")));
              emit(state.copyWith(isLoading: true));
              FlutterLogs.logError("EncryptionBloc Log", "Decryption Error",
                  "Error : ${e.toString()} Image Name: ${imageModel.imageName}");
            }
          },
          encryptImage: (XFile xfile, BuildContext context) async {
            emit(state.copyWith(isLoading: true));
            File image = File(xfile.path);
            String id = xfile.name.split(".").first;
            try {
              List<String> isDeleted =
                  await PhotoManager.editor.deleteWithIds([id]);

              if (isDeleted.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Delete Photo to save to locker")));
                emit(state.copyWith(isLoading: false));
                FlutterLogs.logWarn(
                    "EncryptionBloc Log",
                    "Encryption Deletion Warning",
                    "Warning : Delete image before starting encryption Image Name: ${xfile.name}");
              } else {
                await compute(
                        EncryptionService.encryptImageIsolateHandler,
                        EncryptImageIsolateArgs(
                            rootIsolateToken: RootIsolateToken.instance!,
                            image: image,
                            key: _key,
                            iv: _iv))
                    .then((path) {
                  EncryptedImageModel encryptedImageModel = EncryptedImageModel(
                    dateCreated: DateTime.now(),
                    imageName: image.uri.pathSegments.last,
                    encryptedImagePath: path,
                    originalImagePath: image.path,
                    originalImageExtension:
                        image.uri.pathSegments.last.split(".").last,
                  );
                  _objectBoxAdapter.addEncryptedImageModel(encryptedImageModel);

                  emit(
                    state.copyWith(
                      images: [...state.images, encryptedImageModel],
                      isLoading: false,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Encrypted Successfully")));
                  FlutterLogs.logInfo("EncryptionBloc Log ", "Image Encrypted",
                      "Image Name: ${encryptedImageModel.imageName} Creation Date: ${encryptedImageModel.dateCreated.toIso8601String()}");
                });
              }
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Please try again")));
              FlutterLogs.logError("EncryptionBloc Log ", "Encryption Error ",
                  "Error : ${e.toString()} Image Name: ${xfile.name}");
              emit(state.copyWith(isLoading: false));
            }
          },
          previewImage:
              (EncryptedImageModel imageModel, BuildContext context) async {
            emit(state.copyWith(isLoading: true));
            try {
              List<int> decrypted = await compute(
                EncryptionService.previewImageIsolateHandler,
                PreviewImageIsolateArgs(
                  rootIsolateToken: RootIsolateToken.instance!,
                  encryptedImagePath: imageModel.encryptedImagePath,
                  key: _key,
                  iv: _iv,
                ),
              );
              emit(
                state.copyWith(
                    currentPreviewImage: Uint8List.fromList(decrypted),
                    currentPreviewImageModel: imageModel,
                    isLoading: false),
              );
              FlutterLogs.logInfo(
                "EncryptionBloc Log",
                "Action:: Preview Image",
                "Image Name: ${imageModel.imageName} Creation Date: ${imageModel.dateCreated.toIso8601String()}",
              );
            } catch (e) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Error Occured")));

              FlutterLogs.logError("EncryptionBloc Log", "Preview Image Error",
                  "Error : ${e.toString()} Image Name: ${imageModel.imageName}");
              emit(
                state.copyWith(isLoading: false),
              );
            }
          },
          closePreview: (EncryptedImageModel image, BuildContext context) {
            emit(state.copyWith(
                currentPreviewImage: null, currentPreviewImageModel: null));
          },
        );
      },
    );
  }
}
