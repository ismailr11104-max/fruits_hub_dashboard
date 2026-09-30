import 'dart:io';

import 'package:fruits_hub_dashboard/core/services/fire_base/storage_services.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruits_hub_dashboard/features/add_product/data/date_sourse/upload_image_data_source.dart';

class UploadImageDataSourceImpl implements UploadImageDataSource {
  final StorageServices _storageServices;

  UploadImageDataSourceImpl(this._storageServices);

  @override
  Future<String> uploadUImage({required File image}) async {
    final url = await _storageServices.uploadFile(
      image,
      BackendEndpoint.uploadImage,
    );
    return url;
  }
}
