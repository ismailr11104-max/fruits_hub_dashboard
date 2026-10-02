import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/repo/add_product_repo/add_product_repo.dart';
import 'package:fruits_hub_dashboard/core/repo/image_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entities.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this._addProductRepo, this._imageRepo)
    : super(AddProductInitial());
  final AddProductRepo _addProductRepo;
  final ImageRepo _imageRepo;
  Future<void> addProduct(AddProductInputEntities addProduct) async {
    emit(AddProductLoading());
    final result = await _imageRepo.uploadImage(addProduct.image);
    result.fold(
      (failure) {
        emit(AddProductFailure(failure.message));
      },
      (url) async {
        addProduct.imageUrl = url;
        final result = await _addProductRepo.addProduct(addProduct: addProduct);
        result.fold(
          (failure) {
            emit(AddProductFailure(failure.message));
          },
          (_) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
