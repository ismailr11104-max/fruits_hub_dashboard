import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/core/services/network/storage_services.dart';
import 'package:path/path.dart' as b;

class FireStorageImpl implements StorageServices {
  final FirebaseStorage _fireStorage;
  FireStorageImpl(this._fireStorage);

  @override
  Future<String> uploadFile(File file, String path) async {
    final String fileName = b.basename(file.path);
    final String extensionName = b.extension(file.path);
    final fileReference = _fireStorage.ref().child(
      '$path/$fileName/$extensionName',
    );
    await fileReference.putFile(file);
    final fileImage = await fileReference.getDownloadURL();
    return fileImage;
  }
}
