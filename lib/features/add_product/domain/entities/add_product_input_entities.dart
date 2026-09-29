import 'dart:io';

class AddProductInputEntities {
  final String name;
  final String desc;
  final String code;
  final File image;
  final num price;
  final String? imageUrl;
  final String categoryId;

  AddProductInputEntities({
    required this.name,
    required this.desc,
    required this.code,
    required this.image,
    required this.price,
    this.imageUrl,
    required this.categoryId,
  });
}
