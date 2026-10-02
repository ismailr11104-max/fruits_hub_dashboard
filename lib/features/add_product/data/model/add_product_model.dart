import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/data/model/review_model.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entities.dart';

class AddProductModel {
  final String name;
  final String desc;
  final String code;
  final File image;
  final num price;
  String? imageUrl;
  final String categoryId;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final List<ReviewModel> reviews;

  AddProductModel({
    required this.name,
    required this.desc,
    required this.code,
    required this.image,
    required this.price,
    this.imageUrl,
    required this.categoryId,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.isOrganic = false,
    required this.reviews,
  });

  Map<String, dynamic> toMap() {
    final map = {
      'name': name,
      'desc': desc,
      'code': code,
      'price': price,
      'imageUrl': imageUrl,
      'categoryId': categoryId,
      'expirationsMonths': expirationsMonths,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'reviews': reviews.map((review) => review.toMap()).toList(),
    };
    return map;
  }

  factory AddProductModel.fromEntity(AddProductInputEntities addProduct) {
    final model = AddProductModel(
      name: addProduct.name,
      desc: addProduct.desc,
      code: addProduct.code,
      image: addProduct.image,
      price: addProduct.price,
      imageUrl: addProduct.imageUrl,
      categoryId: addProduct.categoryId,
      expirationsMonths: addProduct.expirationsMonths,
      numberOfCalories: addProduct.numberOfCalories,
      unitAmount: addProduct.unitAmount,
      isOrganic: addProduct.isOrganic,
      reviews: addProduct.reviews
          .map((review) => ReviewModel.fromReviewEntities(review))
          .toList(),
    );
    return model;
  }
}
