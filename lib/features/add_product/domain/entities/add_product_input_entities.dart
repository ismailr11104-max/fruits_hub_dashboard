import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/domain/entities/review_entities.dart';

class AddProductInputEntities {
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
  final List<ReviewEntities> reviews;

  AddProductInputEntities({
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
}
