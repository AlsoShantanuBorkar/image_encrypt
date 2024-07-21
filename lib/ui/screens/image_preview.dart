import 'dart:typed_data';

import 'package:file_encrypt/application/bloc/encryption/encryption_bloc.dart';
import 'package:file_encrypt/application/bloc/encryption/encryption_event.dart';
import 'package:file_encrypt/application/bloc/encryption/encryption_state.dart';
import 'package:file_encrypt/core/services/encryption_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    icon: const Icon(Icons.restore))
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
}
