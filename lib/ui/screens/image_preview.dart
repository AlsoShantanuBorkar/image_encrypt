import 'dart:typed_data';

import 'package:image_encrypt/application/bloc/encryption/encryption_bloc.dart';
import 'package:image_encrypt/application/bloc/encryption/encryption_event.dart';
import 'package:image_encrypt/application/bloc/encryption/encryption_state.dart';
import 'package:image_encrypt/core/models/encrypted_image_model.dart';
import 'package:image_encrypt/core/services/encryption_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:share_plus/share_plus.dart';

class ImagePreviewScreen extends StatefulWidget {
  const ImagePreviewScreen({super.key});

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  final EncryptionService encryptionService = EncryptionService();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EncryptionBloc, EncryptionBlocState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Image Preview"),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<EncryptionBloc>().add(
                        EncryptionBlocEvent.decryptImage(
                            image: state.currentPreviewImageModel!,
                            context: context));
                  },
                  icon: const Icon(Icons.restore),
                ),
                IconButton(
                  onPressed: () => shareImage(
                      currentPreviewImageModel: state.currentPreviewImageModel!,
                      currentPreviewImage: state.currentPreviewImage!),
                  icon: const Icon(Icons.share),
                ),
              ],
            ),
            body: state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  )
                : Center(
                    child: Image.memory(state.currentPreviewImage!),
                  ));
      },
    );
  }

  void shareImage(
      {required EncryptedImageModel currentPreviewImageModel,
      required Uint8List currentPreviewImage}) {
    FlutterLogs.logInfo(
        "Image Share Selected",
        currentPreviewImageModel.imageName,
        currentPreviewImageModel.dateCreated.toIso8601String());
    XFile currentImage = XFile.fromData(currentPreviewImage);
    Share.shareXFiles([currentImage]).then((ShareResult shareResult) {
      if (shareResult.status == ShareResultStatus.success) {
        FlutterLogs.logInfo(
          "Image Shared Successfully ",
          currentPreviewImageModel.imageName,
          currentPreviewImageModel.dateCreated.toIso8601String(),
        );
      } else if (shareResult.status == ShareResultStatus.dismissed) {
        FlutterLogs.logInfo(
          "Image Share Dismissed ",
          currentPreviewImageModel.imageName,
          currentPreviewImageModel.dateCreated.toIso8601String(),
        );
      } else {
        FlutterLogs.logInfo(
          "Image Share Unavailable ",
          currentPreviewImageModel.imageName,
          currentPreviewImageModel.dateCreated.toIso8601String(),
        );
      }
    });
  }
}
