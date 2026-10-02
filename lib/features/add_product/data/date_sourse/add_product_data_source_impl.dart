import 'package:fruits_hub_dashboard/core/services/network/fire_store_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruits_hub_dashboard/features/add_product/data/Model/add_product_model.dart';
import 'package:fruits_hub_dashboard/features/add_product/data/date_sourse/add_product_data_source.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entities.dart';

class AddProductDataSourceImpl implements AddProductDataSource {
  final FireStoreService _storeService;

  AddProductDataSourceImpl(this._storeService);

  @override
  Future<void> addProduct({required AddProductInputEntities addProduct}) async {
    return await _storeService.setData(
      path: BackendEndpoint.addProduct,
      data: AddProductModel.fromEntity(addProduct).toMap(),
    );
  }
}
