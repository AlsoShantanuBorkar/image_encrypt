import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_encrypt/ui/screens/image/image_list_screen.dart';
import 'package:image_encrypt/ui/screens/image_preview.dart';
import 'package:photo_manager/photo_manager.dart';

class AlbumListScreen extends StatefulWidget {
  const AlbumListScreen({super.key});

  @override
  State<AlbumListScreen> createState() => _AlbumListScreenState();
}

class _AlbumListScreenState extends State<AlbumListScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAlbums(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Select Album"),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Select Album"),
          ),
          body: ListView.builder(
            itemCount: snapshot.data!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageListScreen(
                      album: snapshot.data![index],
                    ),
                  ),
                );
              },
              title: Text(snapshot.data![index].name),
            ),
          ),
        );
      },
    );
  }

  Future<List<AssetPathEntity>> getAlbums() async {
    await PhotoManager.requestPermissionExtend();
    List<AssetPathEntity> albums =
        await PhotoManager.getAssetPathList(type: RequestType.image);
    return albums;
  }
}
