import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entities.dart';

class AddProductModel {
  final String name;
  final String desc;
  final String code;
  final File image;
  final num price;
  String? imageUrl;
  final String categoryId;

  AddProductModel({
    required this.name,
    required this.desc,
    required this.code,
    required this.image,
    required this.price,
    this.imageUrl,
    required this.categoryId,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'desc': desc,
      'code': code,
      'image': image.path,
      'price': price,
      'imageUrl': imageUrl,
      'categoryId': categoryId,
    };
  }

  factory AddProductModel.fromEntity(AddProductInputEntities addProduct) {
    return AddProductModel(
      name: addProduct.name,
      desc: addProduct.desc,
      code: addProduct.code,
      image: addProduct.image,
      price: addProduct.price,
      imageUrl: addProduct.imageUrl,
      categoryId: addProduct.categoryId,
    );
  }
}
