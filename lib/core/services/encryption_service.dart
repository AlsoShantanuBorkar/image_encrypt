import 'dart:async';
import 'dart:io';
import 'package:file_encrypt/core/models/encrypted_image_model.dart';
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

    final Uint8List bytes = args.image.readAsBytesSync();
    final encrypt.Encrypted encrypted = encrypter.encryptBytes(bytes, iv: iv);

    final Directory directory = await getApplicationDocumentsDirectory();
    final File encryptedFile =
        File('${directory.path}/${args.image.uri.pathSegments.last}.enc');
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
