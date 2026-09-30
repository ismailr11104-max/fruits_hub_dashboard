import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entities.dart';

abstract class AddProductDataSource {
  Future<void> addProduct({required AddProductInputEntities addProduct});
}
