import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repo/add_product_repo/add_product_repo.dart';
import 'package:fruits_hub_dashboard/features/add_product/data/date_sourse/add_product_data_source.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entities.dart';

class AddProductRepoImpl implements AddProductRepo {
  final AddProductDataSource _dataSource;

  AddProductRepoImpl(this._dataSource);

  @override
  Future<Either<Failures, void>> addProduct({
    required AddProductInputEntities addProduct,
  }) async {
    try {
      final date = await _dataSource.addProduct(addProduct: addProduct);
      return Right(date);
    } catch (e) {
      return Left(ServerFailure('Failed to Add Product'));
    }
  }
}
