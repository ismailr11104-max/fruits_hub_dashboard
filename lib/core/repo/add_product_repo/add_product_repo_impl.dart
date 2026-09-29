import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repo/add_product_repo/add_product_repo.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entities.dart';

class AddProductRepoImpl implements AddProductRepo {
  @override
  Future<Either<Failures, void>> addProduct({
    required AddProductInputEntities addProduct,
  }) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }
}
