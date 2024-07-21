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
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
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
          },
          decryptImage:
              (EncryptedImageModel imageModel, BuildContext context) async {
            emit(state.copyWith(isLoading: true));

            try {
              await compute(
                  decryptImageIsolateHandler,
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

                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Decrypted Successfully")));
                FlutterLogs.logInfo(
                    "Decrypt Image",
                    "Image Name: ${imageModel.imageName}",
                    "Creation Date: ${imageModel.dateCreated.toIso8601String()}");
              });
            } catch (e) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Error Occured")));
              emit(state.copyWith(isLoading: true));
              FlutterLogs.logError(
                  "Decryption Image Error",
                  "Image Name: ${imageModel.imageName}",
                  "Error : ${e.toString()}");
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
                    "Encryption Deletion Warning",
                    "Image Name: ${xfile.name}",
                    "Warning : Delete image before starting encryption");
              } else {
                await compute(
                        encryptImageIsolateHandler,
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
                  FlutterLogs.logInfo(
                      "Encrypt Image  ",
                      "Image Name: ${encryptedImageModel.imageName}",
                      "Creation Date: ${encryptedImageModel.dateCreated.toIso8601String()}");
                });
              }
            } catch (e) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Error Occured")));
              FlutterLogs.logError("Encrypt Image Error ",
                  "Image Name: ${xfile.name}", "Error : ${e.toString()}");
              emit(state.copyWith(isLoading: false));
            }
          },
          previewImage:
              (EncryptedImageModel imageModel, BuildContext context) async {
            emit(state.copyWith(isLoading: true));
            try {
              List<int> decrypted = await compute(
                previewImageIsolateHandler,
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
                    isLoading: false),
              );
              FlutterLogs.logInfo(
                  "Preview Image  ",
                  "Image Name: ${imageModel.imageName}",
                  "Creation Date: ${imageModel.dateCreated.toIso8601String()}");
            } catch (e) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Error Occured")));
              FlutterLogs.logError(
                  "Preview Image Error ",
                  "Image Name: ${imageModel.imageName}",
                  "Error : ${e.toString()}");
              emit(state.copyWith(isLoading: false));
            }
          },
          closePreview: (EncryptedImageModel image, BuildContext context) {
            emit(state.copyWith(currentPreviewImage: null));
          },
        );
      },
    );
  }
}

FutureOr<String> encryptImageIsolateHandler(
    EncryptImageIsolateArgs args) async {
  BackgroundIsolateBinaryMessenger.ensureInitialized(args.rootIsolateToken);

  final encrypt.Key key = encrypt.Key.fromUtf8(args.key);
  final encrypt.IV iv = encrypt.IV.fromUtf8(args.iv);
  final encrypt.Encrypter encrypter =
      encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

  final Uint8List bytes = args.image.readAsBytesSync();
  final encrypt.Encrypted encrypted = encrypter.encryptBytes(bytes, iv: iv);

  final Directory directory = await getApplicationDocumentsDirectory();
  final File encryptedFile =
      File('${directory.path}/${args.image.uri.pathSegments.last}.enc');
  encryptedFile.writeAsBytesSync(encrypted.bytes);
  return encryptedFile.path;
}

FutureOr<void> decryptImageIsolateHandler(DecryptFileIsolateArgs args) async {
  BackgroundIsolateBinaryMessenger.ensureInitialized(args.rootIsolateToken);
  final encrypt.Key key = encrypt.Key.fromUtf8(args.key);
  final encrypt.IV iv = encrypt.IV.fromUtf8(args.iv);
  final encrypt.Encrypter encrypter =
      encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

  final File encryptedFile = File(args.encryptedImageModel.encryptedImagePath);
  final Uint8List bytes = encryptedFile.readAsBytesSync();
  final List<int> decrypted =
      encrypter.decryptBytes(encrypt.Encrypted(bytes), iv: iv);

  PermissionStatus permissionStatus = await Permission.storage.status;
  if (!permissionStatus.isGranted) {
    await Permission.storage.request();
  }

  if (Platform.isIOS) {
    final Directory? directory = await getDownloadsDirectory();
    final File decryptedFile =
        File("$directory/${args.encryptedImageModel.imageName}");
    decryptedFile.writeAsBytesSync(decrypted);
  } else {
    String directory = "/storage/emulated/0/Download/";

    final bool dirDownloadExists = await Directory(directory).exists();
    if (dirDownloadExists) {
      directory = "/storage/emulated/0/Download/";
    } else {
      directory = "/storage/emulated/0/Downloads/";
    }
    final File decryptedFile =
        File("$directory/${args.encryptedImageModel.imageName}");
    decryptedFile.writeAsBytesSync(decrypted);
  }
}

FutureOr<List<int>> previewImageIsolateHandler(PreviewImageIsolateArgs args) {
  BackgroundIsolateBinaryMessenger.ensureInitialized(args.rootIsolateToken);
  final encrypt.Key key = encrypt.Key.fromUtf8(args.key);
  final encrypt.IV iv = encrypt.IV.fromUtf8(args.iv);
  final encrypt.Encrypter encrypter =
      encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

  final File encryptedFile = File(args.encryptedImagePath);
  final Uint8List bytes = encryptedFile.readAsBytesSync();
  final List<int> decrypted =
      encrypter.decryptBytes(encrypt.Encrypted(bytes), iv: iv);
  return decrypted;
}

class PreviewImageIsolateArgs {
  final String encryptedImagePath;
  final String key;
  final String iv;
  final RootIsolateToken rootIsolateToken;
  PreviewImageIsolateArgs(
      {required this.rootIsolateToken,
      required this.encryptedImagePath,
      required this.key,
      required this.iv});
}

class DecryptFileIsolateArgs {
  final EncryptedImageModel encryptedImageModel;
  final String key;
  final String iv;
  final RootIsolateToken rootIsolateToken;
  DecryptFileIsolateArgs(
      {required this.rootIsolateToken,
      required this.encryptedImageModel,
      required this.key,
      required this.iv});
}

class EncryptImageIsolateArgs {
  final File image;
  final String key;
  final String iv;
  final RootIsolateToken rootIsolateToken;
  EncryptImageIsolateArgs(
      {required this.rootIsolateToken,
      required this.image,
      required this.key,
      required this.iv});
}
