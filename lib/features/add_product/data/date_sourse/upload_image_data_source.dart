import 'dart:io';

abstract class UploadImageDataSource {
  Future<String> uploadUImage({required File image});
}
