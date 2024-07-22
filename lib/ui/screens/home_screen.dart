import 'dart:developer';
import 'dart:io';

import 'package:file_encrypt/application/bloc/encryption/encryption_bloc.dart';
import 'package:file_encrypt/application/bloc/encryption/encryption_event.dart';
import 'package:file_encrypt/application/bloc/encryption/encryption_state.dart';
import 'package:file_encrypt/ui/screens/auth/reset_pin_screen.dart';
import 'package:file_encrypt/ui/screens/image_preview.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<EncryptionBloc>().add(EncryptionBlocEvent.init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ResetPinScreen()));
              },
              title: const Text("Reset Pin"),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Image Encryption Demo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final ImagePicker picker = ImagePicker();

          picker.pickImage(source: ImageSource.gallery).then((value) {
            if (value != null) {
              context.read<EncryptionBloc>().add(
                  EncryptionBlocEvent.encryptImage(
                      image: value, context: context));
            }
          });
        },
        child: const Icon(Icons.add_a_photo_outlined),
      ),
      body: BlocBuilder<EncryptionBloc, EncryptionBlocState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                state.images.length,
                (index) => ListTile(
                  onTap: () {
                    context.read<EncryptionBloc>().add(
                        EncryptionBlocEvent.previewImage(
                            image: state.images[index], context: context));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ImagePreviewScreen(),
                      ),
                    );
                  },
                  title: Text(state.images[index].imageName),
                  subtitle: Text(state.images[index].dateCreated.toString()),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
