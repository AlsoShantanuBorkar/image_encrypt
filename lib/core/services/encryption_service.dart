import 'dart:async';
import 'dart:io';
import 'package:image_encrypt/core/models/encrypted_image_model.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:permission_handler/permission_handler.dart';

class EncryptionService {
  EncryptionService();

  static FutureOr<String> encryptImageIsolateHandler(
      EncryptImageIsolateArgs args) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(args.rootIsolateToken);

    final encrypt.Key key = encrypt.Key.fromUtf8(args.key);
    final encrypt.IV iv = encrypt.IV.fromUtf8(args.iv);
    final encrypt.Encrypter encrypter =
        encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

    final Uint8List bytes = args.image;
    final encrypt.Encrypted encrypted = encrypter.encryptBytes(bytes, iv: iv);

    final Directory directory = await getApplicationDocumentsDirectory();
    final File encryptedFile =
        File('${directory.path}/${args.imageNameWithExt}.enc');
    encryptedFile.writeAsBytesSync(encrypted.bytes);
    return encryptedFile.path;
  }

  static FutureOr<void> decryptImageIsolateHandler(
      DecryptFileIsolateArgs args) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(args.rootIsolateToken);
    final encrypt.Key key = encrypt.Key.fromUtf8(args.key);
    final encrypt.IV iv = encrypt.IV.fromUtf8(args.iv);
    final encrypt.Encrypter encrypter =
        encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

    final File encryptedFile =
        File(args.encryptedImageModel.encryptedImagePath);
    final Uint8List bytes = encryptedFile.readAsBytesSync();
    final List<int> decrypted =
        encrypter.decryptBytes(encrypt.Encrypted(bytes), iv: iv);

    PermissionStatus permissionStatus = await Permission.storage.status;
    if (!permissionStatus.isGranted) {
      await Permission.storage.request();
    }
    if (args.encryptedImageModel.originalImagePath.isNotEmpty &&
        !args.encryptedImageModel.originalImagePath.contains("cache")) {
      final File decryptedFile =
          File(args.encryptedImageModel.originalImagePath)..create();
      decryptedFile.writeAsBytesSync(decrypted);
      return;
    }
    if (Platform.isIOS) {
      final Directory? directory = await getDownloadsDirectory();
      final File decryptedFile =
          File("$directory/${args.encryptedImageModel.imageName}")
            ..createSync();
      decryptedFile.writeAsBytesSync(decrypted);
    } else {
      String directory = "/storage/emulated/0/Download/";
      try {
        await Permission.manageExternalStorage.request();
        File decryptedFile =
            File("$directory${args.encryptedImageModel.imageName}")
              ..createSync();
        decryptedFile.writeAsBytesSync(decrypted);
      } catch (e) {
        rethrow;
      }
    }
  }

  static FutureOr<List<int>> previewImageIsolateHandler(
      PreviewImageIsolateArgs args) {
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
  final Uint8List image;
  final String key;
  final String iv;
  final String imageNameWithExt;
  final RootIsolateToken rootIsolateToken;
  EncryptImageIsolateArgs(
      {required this.rootIsolateToken,
      required this.image,
      required this.key,
      required this.imageNameWithExt,
      required this.iv});
}
