import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_encrypt/application/bloc/encryption/encryption_bloc.dart';
import 'package:image_encrypt/application/bloc/encryption/encryption_event.dart';
import 'package:image_encrypt/core/utils/logger.dart';
import 'package:photo_manager/photo_manager.dart';

class ImageListScreen extends StatefulWidget {
  const ImageListScreen({super.key, required this.album});
  final AssetPathEntity album;

  @override
  State<ImageListScreen> createState() => _ImageListScreenState();
}

class _ImageListScreenState extends State<ImageListScreen> {
  ScrollController scrollController = ScrollController();
  int page = 0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (isTop) {
        } else {
          setState(() {
            page++;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getImages(page: page),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: Text(widget.album.name),
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(widget.album.name),
            ),
            body: SingleChildScrollView(
                child: GridView.builder(
              controller: scrollController,
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  context.read<EncryptionBloc>().add(
                        EncryptionBlocEvent.encryptImage(
                          image: snapshot.data![index].file,
                          imagePath: snapshot.data![index].id,
                          context: context,
                        ),
                      );
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Image.file(
                  snapshot.data![index].file,
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2,
                ),
              ),
            )),
          );
        });
  }

  Future<List<_EncryptImageArgs>> getImages({int page = 0}) async {
    List<_EncryptImageArgs> images = [];
    List<AssetEntity> assetEntity =
        await widget.album.getAssetListPaged(page: page, size: 50);
    for (var i = 0; i < assetEntity.length; i++) {
      File? file = await assetEntity[i].originFile;
      if (file != null) {
        images.add(_EncryptImageArgs(file: file, id: assetEntity[i].id));
      }
    }
    return images;
  }
}

class _EncryptImageArgs {
  final File file;
  final String id;
  _EncryptImageArgs({
    required this.file,
    required this.id,
  });
}
