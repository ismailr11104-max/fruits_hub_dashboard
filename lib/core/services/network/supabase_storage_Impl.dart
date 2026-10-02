import 'dart:io';

import 'package:fruits_hub_dashboard/core/services/network/storage_services.dart';
import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageImpl implements StorageServices {
  final SupabaseStorageClient _client;

  SupabaseStorageImpl(this._client);

  @override
  Future<String> uploadFile(File file, String path) async {
    final String fileName = b.basename(file.path);
    final String filePath = '$path/$fileName';
    return await _client.from('e-commerce_image').upload(filePath, file);
  }
}
