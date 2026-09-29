import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entities.dart';

abstract class AddProductRepo {
  Future<Either<Failures, void>> addProduct({
    required AddProductInputEntities addProduct,
  });
}
