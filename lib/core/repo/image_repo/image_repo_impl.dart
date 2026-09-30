import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repo/image_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/features/add_product/data/date_sourse/upload_image_data_source.dart';

class ImageRepoImpl implements ImageRepo {
  final UploadImageDataSource _source;

  ImageRepoImpl(this._source);

  @override
  Future<Either<Failures, String>> uploadImage(File image) async {
    try {
      final result = await _source.uploadUImage(image: image);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure('Failed to upload image'));
    }
  }
}
