import 'dart:developer';
import 'dart:io';

import 'package:file_encrypt/core/models/encrypted_image_model.dart';
import 'package:file_encrypt/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

class ObjectBoxAdapter {
  late final Store store;
  late Box<EncryptedImageModel> images;
  ObjectBoxAdapter._create(this.store) {
    images = Box<EncryptedImageModel>(store);
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBoxAdapter> create() async {
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    Directory path = Platform.isIOS
        ? await getApplicationSupportDirectory()
        : await getApplicationDocumentsDirectory();
    // Database database;

    path = await Directory("${path.path}/store").create(recursive: true);
    // final Directory path = await Directory(path).create(recursive: true);

    Store store;
    log("Store is open ${Store.isOpen(path.path)}");
    if (Store.isOpen(path.path)) {
      log("Objectbox attached in create method");
      store = Store.attach(getObjectBoxModel(), path.path);
    } else {
      log("Objectbox created in create method");
      store = Store(getObjectBoxModel(), directory: path.path);
    }
    return ObjectBoxAdapter._create(store);
  }

  static Future<ObjectBoxAdapter> createWithPath(String path) async {
    Store store;
    log("Store is open ${Store.isOpen(path)}");
    if (Store.isOpen(path)) {
      log("Objectbox attached in create method");
      store = Store.attach(getObjectBoxModel(), path);
    } else {
      log("Objectbox created in create method");
      store = Store(getObjectBoxModel(), directory: path);
    }
    return ObjectBoxAdapter._create(store);
  }

  static Future<ObjectBoxAdapter> attach() async {
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    Directory path = Platform.isIOS
        ? await getApplicationSupportDirectory()
        : await getApplicationDocumentsDirectory();

    path = await Directory("${path.path}/store").create(recursive: true);
    Store store;
    log("Store is open ${Store.isOpen(path.path)}");
    // try {
    if (Store.isOpen(path.path)) {
      log("Objectbox attched in attach method");

      store = Store.attach(getObjectBoxModel(), path.path);
      return ObjectBoxAdapter._create(store);
    } else {
      log("Objectbox created in attach method");

      store = Store(getObjectBoxModel(), directory: path.path);
      return ObjectBoxAdapter._create(store);
    }
  }

  void removeEncryptedImageModel(EncryptedImageModel model) {
    Query query = images
        .query(EncryptedImageModel_.encryptedImagePath
            .equals(model.encryptedImagePath))
        .build();
    EncryptedImageModel? found = query.findFirst();

    if (found != null) {
      images.remove(found.id);
    }
  }

  void addEncryptedImageModel(EncryptedImageModel model) {
    images.put(model, mode: PutMode.put);
  }
}
