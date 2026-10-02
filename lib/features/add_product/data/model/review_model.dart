import 'package:fruits_hub_dashboard/features/add_product/domain/entities/review_entities.dart';

class ReviewModel {
  final String name;
  final String image;
  final num rating;
  final String data;
  final String comment;

  ReviewModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.data,
    required this.comment,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'rating': rating,
      'data': data,
      'comment': comment,
    };
  }

  factory ReviewModel.fromReviewEntities(ReviewEntities review) {
    return ReviewModel(
      name: review.name,
      image: review.image,
      rating: review.rating,
      data: review.data,
      comment: review.comment,
    );
  }
}
